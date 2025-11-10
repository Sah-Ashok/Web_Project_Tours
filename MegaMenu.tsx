/**
 * MegaMenu Component - Interactive Destinations Dropdown
 * 
 * @description
 * A fully accessible mega menu component for displaying destinations with categories,
 * search functionality, and mobile-optimized layout.
 * 
 * Features:
 * - Hover activation (desktop) with 200ms delay
 * - Click/tap activation (mobile/tablet)
 * - Keyboard navigation (Arrow keys, Enter, ESC, Home, End)
 * - Lazy image loading with IntersectionObserver
 * - SessionStorage caching for performance
 * - Mobile search with real-time filtering
 * - Alphabet jump navigation (mobile)
 * - WCAG 2.1 Level AA compliant
 * 
 * @version 1.0.0
 * @author Tours & Travels Dev Team
 */

import React, { useState, useEffect, useRef, useCallback } from 'react';

// ============================================================================
// TYPESCRIPT INTERFACES
// ============================================================================

interface DestinationImage {
  thumbnail: string;
  fallback: string;
  alt: string;
  lazyLoad: boolean;
}

interface Destination {
  id: string;
  name: string;
  country: string;
  region: string;
  interests: string[];
  price: number;
  currency: string;
  rating: number;
  reviewCount: number;
  image: DestinationImage;
  description: string;
  highlights: string[];
  bestSeason: string;
  duration: string;
  url: string;
}

interface Region {
  id: string;
  name: string;
  count: number;
  icon: string;
  url: string;
  featured: string[];
}

interface Interest {
  id: string;
  name: string;
  count: number;
  icon: string;
  url: string;
  description: string;
}

interface DestinationsData {
  popularDestinations: Destination[];
  regions: Region[];
  interests: Interest[];
  config?: {
    hoverDelay: number;
    animationDuration: number;
    fadeOutDuration: number;
    cacheExpiry: number;
    lazyLoadOffset: number;
  };
}

interface MegaMenuProps {
  /** Trigger element text/label */
  label?: string;
  /** Icon class for trigger (Font Awesome) */
  icon?: string;
  /** Hover delay in milliseconds (desktop) */
  hoverDelay?: number;
  /** URL to fetch destinations data */
  dataUrl?: string;
  /** Pre-loaded destinations data (alternative to dataUrl) */
  data?: DestinationsData;
  /** Callback when menu opens */
  onOpen?: () => void;
  /** Callback when menu closes */
  onClose?: () => void;
  /** Callback when destination is selected */
  onDestinationSelect?: (destination: Destination) => void;
  /** Custom className for wrapper */
  className?: string;
  /** Enable analytics tracking */
  trackAnalytics?: boolean;
}

// ============================================================================
// MAIN COMPONENT
// ============================================================================

const MegaMenu: React.FC<MegaMenuProps> = ({
  label = 'Destinations',
  icon = 'fa-solid fa-map-location-dot',
  hoverDelay = 200,
  dataUrl = '/destinations-data.json',
  data: initialData,
  onOpen,
  onClose,
  onDestinationSelect,
  className = '',
  trackAnalytics = false,
}) => {
  // State
  const [isOpen, setIsOpen] = useState(false);
  const [data, setData] = useState<DestinationsData | null>(initialData || null);
  const [loading, setLoading] = useState(!initialData);
  const [searchQuery, setSearchQuery] = useState('');
  const [activeAlphabet, setActiveAlphabet] = useState<string | null>(null);
  const [isMobile, setIsMobile] = useState(false);

  // Refs
  const wrapperRef = useRef<HTMLDivElement>(null);
  const menuRef = useRef<HTMLDivElement>(null);
  const triggerRef = useRef<HTMLAnchorElement>(null);
  const hoverTimeoutRef = useRef<NodeJS.Timeout | null>(null);

  // Cache constants
  const CACHE_KEY = 'destinations_data_cache';
  const CACHE_EXPIRY = 3600000; // 1 hour

  // ============================================================================
  // DATA LOADING & CACHING
  // ============================================================================

  const loadData = useCallback(async () => {
    // Check if data is already provided
    if (initialData) {
      setData(initialData);
      setLoading(false);
      return;
    }

    // Check sessionStorage cache
    try {
      const cachedData = sessionStorage.getItem(CACHE_KEY);
      if (cachedData) {
        const parsed = JSON.parse(cachedData);
        const now = Date.now();
        if (parsed.timestamp && now - parsed.timestamp < CACHE_EXPIRY) {
          console.log('✅ Using cached destinations data');
          setData(parsed.data);
          setLoading(false);
          return;
        }
      }
    } catch (e) {
      console.warn('Cache parse error:', e);
    }

    // Fetch fresh data
    try {
      const response = await fetch(dataUrl);
      if (!response.ok) throw new Error('Failed to load destinations');
      const fetchedData = await response.json();

      // Cache the data
      sessionStorage.setItem(
        CACHE_KEY,
        JSON.stringify({
          data: fetchedData,
          timestamp: Date.now(),
        })
      );

      console.log('✅ Loaded fresh destinations data');
      setData(fetchedData);
    } catch (error) {
      console.error('Error loading destinations:', error);
    } finally {
      setLoading(false);
    }
  }, [dataUrl, initialData]);

  // Preload data on mount
  useEffect(() => {
    loadData();
  }, [loadData]);

  // ============================================================================
  // RESPONSIVE DETECTION
  // ============================================================================

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 1024);
    };

    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  // ============================================================================
  // OPEN/CLOSE HANDLERS
  // ============================================================================

  const openMenu = useCallback(() => {
    if (isOpen) return;
    setIsOpen(true);
    onOpen?.();

    if (trackAnalytics) {
      console.log('📊 Analytics: Mega menu opened');
    }

    // Focus trap for mobile
    if (isMobile) {
      setTimeout(() => {
        const firstFocusable = menuRef.current?.querySelector<HTMLElement>(
          'a, button, input'
        );
        firstFocusable?.focus();
      }, 300);
    }
  }, [isOpen, onOpen, trackAnalytics, isMobile]);

  const closeMenu = useCallback(() => {
    if (!isOpen) return;
    setIsOpen(false);
    setSearchQuery('');
    setActiveAlphabet(null);
    onClose?.();

    if (trackAnalytics) {
      console.log('📊 Analytics: Mega menu closed');
    }
  }, [isOpen, onClose, trackAnalytics]);

  // ============================================================================
  // HOVER HANDLERS (DESKTOP)
  // ============================================================================

  const handleMouseEnter = () => {
    if (isMobile) return;

    if (hoverTimeoutRef.current) {
      clearTimeout(hoverTimeoutRef.current);
    }

    hoverTimeoutRef.current = setTimeout(() => {
      openMenu();
    }, hoverDelay);
  };

  const handleMouseLeave = () => {
    if (isMobile) return;

    if (hoverTimeoutRef.current) {
      clearTimeout(hoverTimeoutRef.current);
    }

    closeMenu();
  };

  // ============================================================================
  // CLICK HANDLER (MOBILE)
  // ============================================================================

  const handleTriggerClick = (e: React.MouseEvent<HTMLAnchorElement>) => {
    if (isMobile) {
      e.preventDefault();
      if (isOpen) {
        closeMenu();
      } else {
        openMenu();
      }
    }
  };

  // ============================================================================
  // OUTSIDE CLICK HANDLER
  // ============================================================================

  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (
        isOpen &&
        wrapperRef.current &&
        !wrapperRef.current.contains(e.target as Node)
      ) {
        closeMenu();
      }
    };

    document.addEventListener('click', handleClickOutside);
    return () => document.removeEventListener('click', handleClickOutside);
  }, [isOpen, closeMenu]);

  // ============================================================================
  // KEYBOARD HANDLERS
  // ============================================================================

  useEffect(() => {
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && isOpen) {
        closeMenu();
        triggerRef.current?.focus();
      }
    };

    document.addEventListener('keydown', handleEscape);
    return () => document.removeEventListener('keydown', handleEscape);
  }, [isOpen, closeMenu]);

  const handleKeyNavigation = (e: React.KeyboardEvent<HTMLDivElement>) => {
    const focusableElements = Array.from(
      menuRef.current?.querySelectorAll<HTMLElement>(
        'a[role="menuitem"], button:not([disabled])'
      ) || []
    );

    const currentIndex = focusableElements.indexOf(
      document.activeElement as HTMLElement
    );

    switch (e.key) {
      case 'ArrowDown':
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % focusableElements.length;
        focusableElements[nextIndex]?.focus();
        break;

      case 'ArrowUp':
        e.preventDefault();
        const prevIndex =
          currentIndex - 1 < 0
            ? focusableElements.length - 1
            : currentIndex - 1;
        focusableElements[prevIndex]?.focus();
        break;

      case 'Home':
        e.preventDefault();
        focusableElements[0]?.focus();
        break;

      case 'End':
        e.preventDefault();
        focusableElements[focusableElements.length - 1]?.focus();
        break;

      case 'Enter':
        if ((e.target as HTMLElement).tagName === 'A') {
          closeMenu();
        }
        break;
    }
  };

  // ============================================================================
  // SEARCH HANDLER
  // ============================================================================

  const handleSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSearchQuery(e.target.value.toLowerCase());
  };

  const filteredDestinations = data?.popularDestinations.filter(
    (dest) =>
      dest.name.toLowerCase().includes(searchQuery) ||
      dest.country.toLowerCase().includes(searchQuery)
  );

  // ============================================================================
  // ALPHABET NAVIGATION
  // ============================================================================

  const handleAlphabetClick = (letter: string) => {
    setActiveAlphabet(letter);
    const firstMatch = data?.popularDestinations.find((dest) =>
      dest.name.toLowerCase().startsWith(letter.toLowerCase())
    );

    if (firstMatch) {
      const element = document.querySelector(
        `[data-destination="${firstMatch.id}"]`
      );
      element?.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
  };

  // ============================================================================
  // DESTINATION SELECT HANDLER
  // ============================================================================

  const handleDestinationClick = (destination: Destination) => {
    onDestinationSelect?.(destination);
    closeMenu();

    if (trackAnalytics) {
      console.log('📊 Analytics: Destination selected:', destination.name);
    }
  };

  // ============================================================================
  // RENDER
  // ============================================================================

  if (!data && !loading) {
    return null; // Data failed to load
  }

  const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  return (
    <div
      ref={wrapperRef}
      className={`relative ${className}`}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      {/* Trigger Link */}
      <a
        ref={triggerRef}
        href="/Destination.aspx"
        className={`text-white hover:text-ecru transition-colors font-medium nav-link py-4 focus:outline-none focus-visible:ring-2 focus-visible:ring-accent-color rounded-sm destinations-nav-link ${
          isOpen ? 'mega-menu-open' : ''
        }`}
        onClick={handleTriggerClick}
        aria-expanded={isOpen}
        aria-haspopup="true"
        aria-controls="mega-menu"
      >
        <i className={`${icon} mr-2`}></i>
        {label}
      </a>

      {/* Mega Menu */}
      <div
        ref={menuRef}
        id="mega-menu"
        className={`mega-menu-container ${isOpen ? 'active' : ''}`}
        role="menu"
        aria-label="Destinations Menu"
        onKeyDown={handleKeyNavigation}
      >
        {/* Mobile Close Button */}
        <button
          className="mega-menu-close"
          onClick={closeMenu}
          aria-label="Close menu"
        >
          <i className="fa-solid fa-times"></i>
        </button>

        {/* Mobile Search */}
        {isMobile && (
          <div className="mega-menu-search">
            <input
              type="text"
              className="mega-menu-search-input"
              placeholder="Search destinations..."
              value={searchQuery}
              onChange={handleSearch}
              aria-label="Search destinations"
            />
          </div>
        )}

        {/* Loading State */}
        {loading && (
          <div className="text-center py-8 text-gray-500">
            <i className="fa-solid fa-spinner fa-spin text-2xl mb-2"></i>
            <p>Loading destinations...</p>
          </div>
        )}

        {/* Menu Content */}
        {!loading && data && (
          <div className="mega-menu-grid">
            {/* Popular Destinations */}
            <div className="mega-menu-popular">
              <h3 className="mega-menu-section-title">Popular Destinations</h3>
              <div>
                {(searchQuery ? filteredDestinations : data.popularDestinations)?.map(
                  (dest) => (
                    <DestinationCard
                      key={dest.id}
                      destination={dest}
                      onClick={() => handleDestinationClick(dest)}
                    />
                  )
                )}
              </div>
            </div>

            {/* Categories */}
            <div className="mega-menu-categories">
              {/* Regions */}
              <h3 className="mega-menu-section-title">By Region</h3>
              <div className="category-list">
                {data.regions.map((region) => (
                  <CategoryItem key={region.id} category={region} />
                ))}
              </div>

              {/* Interests */}
              <h3 className="mega-menu-section-title" style={{ marginTop: '24px' }}>
                By Interest
              </h3>
              <div className="category-list">
                {data.interests.slice(0, 4).map((interest) => (
                  <CategoryItem key={interest.id} category={interest} />
                ))}
              </div>
            </div>
          </div>
        )}

        {/* Alphabet Navigation (Mobile) */}
        {isMobile && (
          <div className="alphabet-nav">
            {alphabet.map((letter) => (
              <span
                key={letter}
                className={`alphabet-nav-item ${
                  activeAlphabet === letter ? 'active' : ''
                }`}
                onClick={() => handleAlphabetClick(letter)}
              >
                {letter}
              </span>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

// ============================================================================
// SUB-COMPONENTS
// ============================================================================

interface DestinationCardProps {
  destination: Destination;
  onClick: () => void;
}

const DestinationCard: React.FC<DestinationCardProps> = ({
  destination,
  onClick,
}) => {
  const [imageLoaded, setImageLoaded] = useState(false);
  const imgRef = useRef<HTMLImageElement>(null);

  useEffect(() => {
    if (!imgRef.current) return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const img = entry.target as HTMLImageElement;
            const src = img.getAttribute('data-src');
            if (src) {
              img.src = src;
              setImageLoaded(true);
              observer.unobserve(img);
            }
          }
        });
      },
      { rootMargin: '100px' }
    );

    observer.observe(imgRef.current);

    return () => observer.disconnect();
  }, []);

  return (
    <a
      href={destination.url}
      className="destination-card"
      role="menuitem"
      tabIndex={0}
      data-destination={destination.id}
      onClick={(e) => {
        e.preventDefault();
        onClick();
      }}
    >
      <img
        ref={imgRef}
        src={destination.image.fallback}
        data-src={destination.image.thumbnail}
        alt={destination.image.alt}
        className={`destination-thumbnail ${imageLoaded ? 'loaded' : 'lazy'}`}
        loading="lazy"
      />
      <div className="destination-info">
        <div className="destination-name">{destination.name}</div>
        <div className="destination-country">{destination.country}</div>
        <div>
          <span className="destination-price">
            From ${destination.price}
          </span>
          <span className="destination-rating">
            {destination.rating} <i className="fa-solid fa-star star-icon"></i>
          </span>
        </div>
      </div>
    </a>
  );
};

interface CategoryItemProps {
  category: Region | Interest;
}

const CategoryItem: React.FC<CategoryItemProps> = ({ category }) => {
  return (
    <a
      href={category.url}
      className="category-item"
      role="menuitem"
      tabIndex={0}
    >
      <div className="category-item-left">
        <span className="category-icon">{category.icon}</span>
        <span className="category-name">{category.name}</span>
      </div>
      <span className="category-count">{category.count}</span>
    </a>
  );
};

// ============================================================================
// EXPORTS
// ============================================================================

export default MegaMenu;
export type { MegaMenuProps, Destination, Region, Interest, DestinationsData };

// ============================================================================
// USAGE EXAMPLES
// ============================================================================

/**
 * Example 1: Basic Usage
 * 
 * ```tsx
 * import MegaMenu from './MegaMenu';
 * 
 * function Navigation() {
 *   return (
 *     <nav>
 *       <MegaMenu />
 *     </nav>
 *   );
 * }
 * ```
 */

/**
 * Example 2: With Custom Props
 * 
 * ```tsx
 * <MegaMenu
 *   label="Explore Destinations"
 *   icon="fa-solid fa-globe"
 *   hoverDelay={300}
 *   dataUrl="/api/destinations"
 *   onOpen={() => console.log('Menu opened')}
 *   onClose={() => console.log('Menu closed')}
 *   onDestinationSelect={(dest) => {
 *     console.log('Selected:', dest.name);
 *   }}
 *   trackAnalytics={true}
 * />
 * ```
 */

/**
 * Example 3: With Pre-loaded Data
 * 
 * ```tsx
 * const destinationsData = {
 *   popularDestinations: [...],
 *   regions: [...],
 *   interests: [...]
 * };
 * 
 * <MegaMenu data={destinationsData} />
 * ```
 */

/**
 * Example 4: In Navigation Bar
 * 
 * ```tsx
 * function NavBar() {
 *   return (
 *     <header className="navbar">
 *       <div className="logo">Brand</div>
 *       <nav>
 *         <a href="/home">Home</a>
 *         <MegaMenu label="Destinations" />
 *         <a href="/about">About</a>
 *         <a href="/contact">Contact</a>
 *       </nav>
 *     </header>
 *   );
 * }
 * ```
 */

/**
 * Example 5: With Analytics Tracking
 * 
 * ```tsx
 * <MegaMenu
 *   trackAnalytics={true}
 *   onDestinationSelect={(dest) => {
 *     // Send to analytics
 *     gtag('event', 'destination_select', {
 *       destination_name: dest.name,
 *       destination_id: dest.id,
 *       price: dest.price
 *     });
 *   }}
 * />
 * ```
 */
