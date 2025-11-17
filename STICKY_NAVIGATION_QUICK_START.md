# 🚀 Quick Start: Sticky Navigation Snippets

## Copy-Paste Implementation Guide

This document contains ready-to-use code snippets for implementing sticky navigation in other projects.

---

## 📋 HTML Structure

### **Basic Navigation Template**

```html
<!-- Skip to Content Link (Accessibility) -->
<a href="#main-content" class="skip-link">
    Skip to main content
</a>

<!-- Main Navigation -->
<nav id="navbar" class="navbar">
    <div class="navbar-container">
        <!-- Logo -->
        <a href="/" class="navbar-brand">
            <svg id="nav-logo-icon" class="logo-icon" viewBox="0 0 24 24">
                <!-- Your logo SVG paths -->
            </svg>
            <span id="nav-logo-text" class="logo-text">Brand Name</span>
        </a>

        <!-- Navigation Links -->
        <div class="navbar-nav">
            <a href="#home" class="nav-link">Home</a>
            <a href="#about" class="nav-link">About</a>
            <a href="#services" class="nav-link">Services</a>
            <a href="#contact" class="nav-link">Contact</a>
        </div>

        <!-- CTA Button -->
        <a href="#signup" class="navbar-cta">Sign Up</a>
    </div>
</nav>

<!-- Main Content -->
<main id="main-content">
    <!-- Your page content -->
</main>
```

---

## 🎨 CSS Styles

### **Complete Navbar CSS**

```css
/* ============================================================================
   CSS CUSTOM PROPERTIES (THEMING)
   ============================================================================ */
:root {
    --navbar-initial-height: 80px;
    --navbar-scrolled-height: 64px;
    --logo-initial-size: 48px;
    --logo-scrolled-size: 36px;
    --link-initial-size: 16px;
    --link-scrolled-size: 14px;
    --transition-duration: 0.3s;
    --transition-easing: cubic-bezier(0.4, 0, 0.2, 1);
    --accent-color: #f59e0b;
    --dark-color: #073b3a;
    --text-color: #1f2937;
}

/* ============================================================================
   SKIP TO CONTENT LINK (ACCESSIBILITY)
   ============================================================================ */
.skip-link {
    position: absolute;
    left: 0;
    top: -100%;
    padding: 1rem;
    background: var(--accent-color);
    color: white;
    font-weight: 600;
    z-index: 100;
    transition: top 0.3s;
}

.skip-link:focus {
    top: 0;
}

/* ============================================================================
   NAVBAR: INITIAL STATE (Top of Page)
   ============================================================================ */
#navbar {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: var(--navbar-initial-height);
    background-color: transparent;
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    transition: all var(--transition-duration) var(--transition-easing);
    z-index: 1000;
}

.navbar-container {
    max-width: 1200px;
    margin: 0 auto;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 2rem;
}

/* Logo */
.navbar-brand {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    text-decoration: none;
}

#nav-logo-icon {
    width: var(--logo-initial-size);
    height: var(--logo-initial-size);
    fill: white;
    transition: all var(--transition-duration) var(--transition-easing);
}

#nav-logo-text {
    font-size: 1.875rem; /* 30px */
    font-weight: 700;
    color: white;
    text-shadow: 0 0 8px rgba(255, 255, 255, 0.7);
    transition: all var(--transition-duration) var(--transition-easing);
}

/* Navigation Links */
.navbar-nav {
    display: flex;
    align-items: center;
    gap: 2rem;
}

.nav-link {
    position: relative;
    font-size: var(--link-initial-size);
    font-weight: 500;
    color: white;
    text-decoration: none;
    padding-bottom: 0.25rem;
    transition: all var(--transition-duration) var(--transition-easing);
}

.nav-link::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: var(--accent-color);
    transform: scaleX(0);
    transform-origin: bottom right;
    transition: transform 0.3s ease-out;
}

.nav-link:hover::after,
.nav-link:focus::after {
    transform: scaleX(1);
    transform-origin: bottom left;
}

.nav-link.active::after {
    transform: scaleX(1);
    height: 3px;
}

/* CTA Button */
.navbar-cta {
    padding: 0.75rem 1.5rem;
    background: var(--accent-color);
    color: white;
    font-weight: 700;
    text-decoration: none;
    border-radius: 9999px;
    transition: all 0.3s;
}

.navbar-cta:hover {
    transform: scale(1.05);
}

/* ============================================================================
   NAVBAR: SCROLLED STATE (After 100px scroll)
   ============================================================================ */
#navbar.header-scrolled {
    height: var(--navbar-scrolled-height);
    background-color: rgba(255, 255, 255, 0.95);
    box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

/* Logo - Scrolled */
#navbar.header-scrolled #nav-logo-icon {
    width: var(--logo-scrolled-size);
    height: var(--logo-scrolled-size);
    fill: var(--dark-color);
}

#navbar.header-scrolled #nav-logo-text {
    font-size: 1.5rem; /* 24px */
    color: var(--dark-color);
    text-shadow: none;
}

/* Links - Scrolled */
#navbar.header-scrolled .nav-link {
    font-size: var(--link-scrolled-size);
    color: var(--text-color);
}

#navbar.header-scrolled .nav-link:hover {
    color: var(--accent-color);
}

/* ============================================================================
   MOBILE RESPONSIVENESS (Always Compact)
   ============================================================================ */
@media (max-width: 1024px) {
    #navbar {
        height: var(--navbar-scrolled-height);
        background-color: rgba(255, 255, 255, 0.95);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    #nav-logo-icon {
        width: var(--logo-scrolled-size);
        height: var(--logo-scrolled-size);
        fill: var(--dark-color);
    }

    #nav-logo-text {
        font-size: 1.5rem;
        color: var(--dark-color);
        text-shadow: none;
    }

    .navbar-nav {
        display: none; /* Show mobile menu instead */
    }
}

/* ============================================================================
   ACCESSIBILITY: FOCUS STYLES
   ============================================================================ */
a:focus-visible {
    outline: 2px solid var(--accent-color);
    outline-offset: 4px;
    border-radius: 4px;
}

/* ============================================================================
   REDUCED MOTION SUPPORT
   ============================================================================ */
@media (prefers-reduced-motion: reduce) {
    #navbar,
    #nav-logo-icon,
    #nav-logo-text,
    .nav-link,
    .navbar-cta {
        transition: none !important;
    }
}
```

---

## ⚡ JavaScript Implementation

### **Complete Intersection Observer Script**

```javascript
/**
 * Sticky Navigation with Intersection Observer API
 * High-performance scroll detection for navbar state changes
 */
(function() {
    'use strict';
    
    document.addEventListener('DOMContentLoaded', function() {
        // =====================================================================
        // CONFIGURATION
        // =====================================================================
        const SCROLL_THRESHOLD = 100; // px to trigger state change
        const navbar = document.getElementById('navbar');
        
        if (!navbar) {
            console.warn('Navbar element not found');
            return;
        }
        
        // =====================================================================
        // CREATE SENTINEL ELEMENT
        // =====================================================================
        const sentinel = document.createElement('div');
        sentinel.style.cssText = `
            position: absolute;
            top: ${SCROLL_THRESHOLD}px;
            height: 1px;
            width: 100%;
            pointer-events: none;
            visibility: hidden;
        `;
        sentinel.setAttribute('data-scroll-sentinel', '');
        document.body.insertBefore(sentinel, document.body.firstChild);
        
        // =====================================================================
        // INTERSECTION OBSERVER (PRIMARY METHOD)
        // =====================================================================
        if ('IntersectionObserver' in window) {
            const observerOptions = {
                root: null,
                rootMargin: '0px',
                threshold: 0
            };
            
            const observerCallback = (entries) => {
                entries.forEach(entry => {
                    // Sentinel OUT of view = scrolled past threshold
                    if (!entry.isIntersecting) {
                        navbar.classList.add('header-scrolled');
                    } else {
                        navbar.classList.remove('header-scrolled');
                    }
                });
            };
            
            const observer = new IntersectionObserver(observerCallback, observerOptions);
            observer.observe(sentinel);
            
            console.log('✅ Sticky navbar initialized with Intersection Observer');
        }
        // =====================================================================
        // FALLBACK: SCROLL EVENT WITH RAF (LEGACY BROWSERS)
        // =====================================================================
        else {
            console.warn('⚠️ Intersection Observer not supported, using fallback');
            
            let ticking = false;
            
            const checkScroll = () => {
                const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
                
                if (scrollTop > SCROLL_THRESHOLD) {
                    navbar.classList.add('header-scrolled');
                } else {
                    navbar.classList.remove('header-scrolled');
                }
                
                ticking = false;
            };
            
            window.addEventListener('scroll', () => {
                if (!ticking) {
                    window.requestAnimationFrame(checkScroll);
                    ticking = true;
                }
            });
            
            // Initial check
            checkScroll();
        }
        
        // =====================================================================
        // SKIP TO CONTENT LINK (ACCESSIBILITY)
        // =====================================================================
        const skipLink = document.querySelector('.skip-link');
        if (skipLink) {
            skipLink.addEventListener('click', (e) => {
                e.preventDefault();
                const mainContent = document.getElementById('main-content');
                if (mainContent) {
                    mainContent.setAttribute('tabindex', '-1');
                    mainContent.focus();
                    mainContent.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            });
        }
        
        // =====================================================================
        // ACTIVE LINK HIGHLIGHTING
        // =====================================================================
        const currentPath = window.location.pathname;
        const navLinks = document.querySelectorAll('.nav-link');
        
        navLinks.forEach(link => {
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active');
            }
        });
        
        // =====================================================================
        // SMOOTH SCROLL FOR ANCHOR LINKS
        // =====================================================================
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href === '#') return;
                
                e.preventDefault();
                const target = document.querySelector(href);
                
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    });
})();
```

---

## 🎯 Minimal Implementation (Essential Only)

### **HTML**
```html
<nav id="navbar">
    <a href="/" class="brand">
        <span id="nav-logo-text">Brand</span>
    </a>
    <a href="#home" class="nav-link">Home</a>
    <a href="#about" class="nav-link">About</a>
</nav>
```

### **CSS**
```css
#navbar {
    position: fixed;
    top: 0;
    width: 100%;
    height: 80px;
    background: transparent;
    backdrop-filter: blur(10px);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    z-index: 1000;
}

#navbar.header-scrolled {
    height: 64px;
    background: rgba(255, 255, 255, 0.95);
    box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
}

#nav-logo-text {
    font-size: 30px;
    transition: font-size 0.3s;
}

#navbar.header-scrolled #nav-logo-text {
    font-size: 24px;
}
```

### **JavaScript**
```javascript
const navbar = document.getElementById('navbar');
const sentinel = document.createElement('div');
sentinel.style.cssText = 'position:absolute;top:100px;height:1px;';
document.body.prepend(sentinel);

const observer = new IntersectionObserver(entries => {
    navbar.classList.toggle('header-scrolled', !entries[0].isIntersecting);
});
observer.observe(sentinel);
```

---

## 🔧 Customization Examples

### **Change Scroll Threshold**
```javascript
// Trigger at 50px instead of 100px
sentinel.style.top = '50px';
```

### **Different Transition Speed**
```css
#navbar {
    transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1); /* Slower */
}
```

### **Custom Height Values**
```css
:root {
    --navbar-initial-height: 100px; /* Was 80px */
    --navbar-scrolled-height: 70px; /* Was 64px */
}
```

### **Different Color Scheme**
```css
:root {
    --accent-color: #3b82f6; /* Blue */
    --dark-color: #1e293b;   /* Slate */
}
```

---

## 🎨 Animation Variations

### **Slide Down Effect**
```css
#navbar {
    transform: translateY(0);
}

#navbar.header-scrolled {
    transform: translateY(-5px);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}
```

### **Fade In/Out**
```css
#navbar {
    opacity: 0.95;
}

#navbar.header-scrolled {
    opacity: 1;
}
```

### **Scale Effect**
```css
#nav-logo-icon {
    transform: scale(1);
}

#navbar.header-scrolled #nav-logo-icon {
    transform: scale(0.75);
}
```

---

## 🚀 Framework Integration

### **React Component**
```jsx
import { useEffect, useState } from 'react';

export function StickyNavbar() {
    const [isScrolled, setIsScrolled] = useState(false);
    
    useEffect(() => {
        const sentinel = document.createElement('div');
        sentinel.style.cssText = 'position:absolute;top:100px;height:1px;';
        document.body.prepend(sentinel);
        
        const observer = new IntersectionObserver(([entry]) => {
            setIsScrolled(!entry.isIntersecting);
        });
        
        observer.observe(sentinel);
        
        return () => observer.disconnect();
    }, []);
    
    return (
        <nav className={`navbar ${isScrolled ? 'scrolled' : ''}`}>
            {/* Your nav content */}
        </nav>
    );
}
```

### **Vue Component**
```vue
<template>
    <nav :class="['navbar', { scrolled: isScrolled }]">
        <!-- Your nav content -->
    </nav>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const isScrolled = ref(false);
let observer = null;

onMounted(() => {
    const sentinel = document.createElement('div');
    sentinel.style.cssText = 'position:absolute;top:100px;height:1px;';
    document.body.prepend(sentinel);
    
    observer = new IntersectionObserver(([entry]) => {
        isScrolled.value = !entry.isIntersecting;
    });
    
    observer.observe(sentinel);
});

onUnmounted(() => {
    if (observer) observer.disconnect();
});
</script>
```

---

## 📊 Performance Monitoring

### **Measure FPS During Scroll**
```javascript
let lastTime = performance.now();
let frames = 0;

function measureFPS() {
    const currentTime = performance.now();
    frames++;
    
    if (currentTime >= lastTime + 1000) {
        console.log(`FPS: ${frames}`);
        frames = 0;
        lastTime = currentTime;
    }
    
    requestAnimationFrame(measureFPS);
}

measureFPS();
```

### **Monitor Class Changes**
```javascript
const observer = new MutationObserver(mutations => {
    mutations.forEach(mutation => {
        if (mutation.attributeName === 'class') {
            console.log('Navbar class changed:', mutation.target.className);
        }
    });
});

observer.observe(navbar, { attributes: true });
```

---

## 🐛 Debugging Tools

### **Visual Sentinel Indicator**
```javascript
// Make sentinel visible for debugging
sentinel.style.cssText += `
    visibility: visible;
    background: red;
    height: 2px;
    opacity: 0.5;
`;
```

### **Console Logging**
```javascript
const observerCallback = (entries) => {
    entries.forEach(entry => {
        console.log('Intersecting:', entry.isIntersecting);
        console.log('Scroll position:', window.pageYOffset);
        
        if (!entry.isIntersecting) {
            console.log('✅ Header scrolled state');
            navbar.classList.add('header-scrolled');
        } else {
            console.log('⬆️ Header initial state');
            navbar.classList.remove('header-scrolled');
        }
    });
};
```

---

## ✅ Testing Checklist

```javascript
// Run these tests in browser console

// 1. Check if navbar exists
console.log('Navbar:', document.getElementById('navbar'));

// 2. Check if Intersection Observer is supported
console.log('IO Support:', 'IntersectionObserver' in window);

// 3. Check current scroll position
console.log('Scroll:', window.pageYOffset);

// 4. Check if class is applied
console.log('Has scrolled class:', 
    document.getElementById('navbar').classList.contains('header-scrolled'));

// 5. Manually trigger state change
document.getElementById('navbar').classList.toggle('header-scrolled');

// 6. Check computed styles
console.log('Height:', 
    getComputedStyle(document.getElementById('navbar')).height);
```

---

## 📚 Additional Resources

- [Intersection Observer API - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API)
- [RequestAnimationFrame - MDN](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame)
- [CSS Transitions - MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions)
- [Cubic Bezier Generator](https://cubic-bezier.com/)

---

**Quick Start Complete** ✅  
*All code snippets are production-ready and tested across modern browsers.*
