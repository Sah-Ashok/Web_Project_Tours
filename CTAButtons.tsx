/**
 * CTA Buttons - React Component Version
 * Modern Login & Sign Up buttons with conversion-optimized design
 * 
 * @author Tours & Travels Team
 * @version 1.0.0
 * @license MIT
 */

import React from 'react';

// ============================================================================
// ICONS (Lucide-inspired)
// ============================================================================

const LoginIcon = () => (
  <svg 
    xmlns="http://www.w3.org/2000/svg" 
    width="18" 
    height="18" 
    viewBox="0 0 24 24" 
    fill="none" 
    stroke="currentColor" 
    strokeWidth="2" 
    strokeLinecap="round" 
    strokeLinejoin="round"
  >
    <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4" />
    <polyline points="10 17 15 12 10 7" />
    <line x1="15" y1="12" x2="3" y2="12" />
  </svg>
);

const SignUpIcon = () => (
  <svg 
    xmlns="http://www.w3.org/2000/svg" 
    width="18" 
    height="18" 
    viewBox="0 0 24 24" 
    fill="none" 
    stroke="currentColor" 
    strokeWidth="2" 
    strokeLinecap="round" 
    strokeLinejoin="round"
  >
    <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
    <circle cx="9" cy="7" r="4" />
    <line x1="19" y1="8" x2="19" y2="14" />
    <line x1="22" y1="11" x2="16" y2="11" />
  </svg>
);

// ============================================================================
// PRIMARY BUTTON (Sign Up)
// ============================================================================

interface PrimaryButtonProps {
  href?: string;
  onClick?: (e: React.MouseEvent) => void;
  children: React.ReactNode;
  ariaLabel?: string;
  className?: string;
  showIcon?: boolean;
}

export const PrimaryButton: React.FC<PrimaryButtonProps> = ({
  href = '/register',
  onClick,
  children,
  ariaLabel = 'Create new account',
  className = '',
  showIcon = true,
}) => {
  const handleClick = (e: React.MouseEvent<HTMLAnchorElement>) => {
    if (onClick) {
      onClick(e);
    }
  };

  return (
    <a
      href={href}
      onClick={handleClick}
      aria-label={ariaLabel}
      role="button"
      className={`btn-primary-cta ${className}`}
    >
      {showIcon && <SignUpIcon />}
      <span>{children}</span>
    </a>
  );
};

// ============================================================================
// SECONDARY BUTTON (Login)
// ============================================================================

interface SecondaryButtonProps {
  href?: string;
  onClick?: (e: React.MouseEvent) => void;
  children: React.ReactNode;
  ariaLabel?: string;
  className?: string;
  showIcon?: boolean;
}

export const SecondaryButton: React.FC<SecondaryButtonProps> = ({
  href = '/login',
  onClick,
  children,
  ariaLabel = 'Access your account',
  className = '',
  showIcon = true,
}) => {
  const handleClick = (e: React.MouseEvent<HTMLAnchorElement>) => {
    if (onClick) {
      onClick(e);
    }
  };

  return (
    <a
      href={href}
      onClick={handleClick}
      aria-label={ariaLabel}
      role="button"
      className={`btn-secondary-cta ${className}`}
    >
      {showIcon && <LoginIcon />}
      <span>{children}</span>
    </a>
  );
};

// ============================================================================
// CTA BUTTONS CONTAINER
// ============================================================================

interface CTAButtonsProps {
  loginHref?: string;
  signUpHref?: string;
  onLoginClick?: (e: React.MouseEvent) => void;
  onSignUpClick?: (e: React.MouseEvent) => void;
  loginText?: string;
  signUpText?: string;
  className?: string;
  showIcons?: boolean;
}

export const CTAButtons: React.FC<CTAButtonsProps> = ({
  loginHref = '/login',
  signUpHref = '/register',
  onLoginClick,
  onSignUpClick,
  loginText = 'Login',
  signUpText = 'Sign Up',
  className = '',
  showIcons = true,
}) => {
  return (
    <div className={`cta-buttons-container ${className}`}>
      <SecondaryButton
        href={loginHref}
        onClick={onLoginClick}
        ariaLabel="Access your account"
        showIcon={showIcons}
      >
        {loginText}
      </SecondaryButton>
      
      <PrimaryButton
        href={signUpHref}
        onClick={onSignUpClick}
        ariaLabel="Create new account"
        showIcon={showIcons}
      >
        {signUpText}
      </PrimaryButton>
    </div>
  );
};

// ============================================================================
// CSS STYLES (To be added to your global CSS or styled-components)
// ============================================================================

export const ctaButtonsStyles = `
/* CTA Buttons Container */
.cta-buttons-container {
  display: flex;
  align-items: center;
  gap: 16px;
}

/* Primary Button (Sign Up) */
.btn-primary-cta {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 12px 24px;
  font-size: 14px;
  font-weight: 600;
  color: #FFFFFF;
  background: linear-gradient(135deg, #FF6B35 0%, #FF8C42 100%);
  border: none;
  border-radius: 24px;
  cursor: pointer;
  text-decoration: none;
  overflow: hidden;
  transition: all 0.2s ease-out;
  min-height: 44px;
}

.btn-primary-cta:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 12px rgba(255, 107, 53, 0.4);
}

.btn-primary-cta:active {
  transform: scale(0.98);
}

.btn-primary-cta:focus-visible {
  outline: 3px solid #FF6B35;
  outline-offset: 3px;
}

/* Ripple Effect */
.btn-primary-cta::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.4);
  transform: translate(-50%, -50%);
  transition: width 0.6s, height 0.6s;
}

.btn-primary-cta:active::before {
  width: 300px;
  height: 300px;
}

.btn-primary-cta svg {
  width: 18px;
  height: 18px;
  flex-shrink: 0;
}

/* Secondary Button (Login) */
.btn-secondary-cta {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 10px 22px;
  font-size: 14px;
  font-weight: 500;
  color: #2D5F5D;
  background: transparent;
  border: 2px solid #2D5F5D;
  border-radius: 24px;
  cursor: pointer;
  text-decoration: none;
  transition: all 0.2s ease-out;
  min-height: 44px;
}

.btn-secondary-cta:hover {
  background: rgba(45, 95, 93, 0.1);
}

.btn-secondary-cta:active {
  border-color: #1A3938;
}

.btn-secondary-cta:focus-visible {
  outline: 3px solid #2D5F5D;
  outline-offset: 3px;
}

/* Mobile Responsive */
@media (max-width: 1024px) {
  .cta-buttons-container {
    flex-direction: column;
    gap: 12px;
    width: 100%;
  }

  .btn-primary-cta,
  .btn-secondary-cta {
    width: 100%;
  }
}

@media (max-width: 640px) {
  .btn-primary-cta,
  .btn-secondary-cta {
    padding-left: 16px;
    padding-right: 16px;
    font-size: 13px;
  }
}
`;

// ============================================================================
// USAGE EXAMPLES
// ============================================================================

// Example 1: Basic Usage
export const Example1 = () => {
  return (
    <CTAButtons 
      loginHref="/login" 
      signUpHref="/register"
    />
  );
};

// Example 2: With Click Handlers
export const Example2 = () => {
  const handleLogin = (e: React.MouseEvent) => {
    e.preventDefault();
    console.log('Login clicked');
    // Navigate programmatically or show modal
  };

  const handleSignUp = (e: React.MouseEvent) => {
    e.preventDefault();
    console.log('Sign up clicked');
    // Navigate programmatically or show modal
  };

  return (
    <CTAButtons 
      onLoginClick={handleLogin}
      onSignUpClick={handleSignUp}
    />
  );
};

// Example 3: Custom Text
export const Example3 = () => {
  return (
    <CTAButtons 
      loginText="Sign In"
      signUpText="Get Started"
    />
  );
};

// Example 4: Without Icons
export const Example4 = () => {
  return (
    <CTAButtons 
      showIcons={false}
    />
  );
};

// Example 5: Individual Buttons
export const Example5 = () => {
  return (
    <div style={{ display: 'flex', gap: '16px' }}>
      <SecondaryButton href="/login">
        Login
      </SecondaryButton>
      
      <PrimaryButton href="/register">
        Sign Up
      </PrimaryButton>
    </div>
  );
};

// ============================================================================
// TAILWIND VERSION (Alternative)
// ============================================================================

export const CTAButtonsTailwind: React.FC<CTAButtonsProps> = ({
  loginHref = '/login',
  signUpHref = '/register',
  onLoginClick,
  onSignUpClick,
  loginText = 'Login',
  signUpText = 'Sign Up',
  showIcons = true,
}) => {
  return (
    <div className="flex items-center gap-4 lg:flex-row flex-col lg:w-auto w-full">
      {/* Secondary Button: Login */}
      <a
        href={loginHref}
        onClick={onLoginClick}
        aria-label="Access your account"
        role="button"
        className="inline-flex items-center justify-center gap-2 px-[22px] py-[10px] text-sm font-medium text-[#2D5F5D] bg-transparent border-2 border-[#2D5F5D] rounded-full cursor-pointer no-underline transition-all duration-200 ease-out min-h-[44px] hover:bg-[#2D5F5D]/10 active:border-[#1A3938] focus-visible:outline focus-visible:outline-3 focus-visible:outline-[#2D5F5D] focus-visible:outline-offset-3 lg:w-auto w-full"
      >
        {showIcons && <LoginIcon />}
        <span>{loginText}</span>
      </a>
      
      {/* Primary Button: Sign Up */}
      <a
        href={signUpHref}
        onClick={onSignUpClick}
        aria-label="Create new account"
        role="button"
        className="relative inline-flex items-center justify-center gap-2 px-6 py-3 text-sm font-semibold text-white bg-gradient-to-br from-[#FF6B35] to-[#FF8C42] border-none rounded-full cursor-pointer no-underline overflow-hidden transition-all duration-200 ease-out min-h-[44px] hover:scale-105 hover:shadow-[0_4px_12px_rgba(255,107,53,0.4)] active:scale-[0.98] focus-visible:outline focus-visible:outline-3 focus-visible:outline-[#FF6B35] focus-visible:outline-offset-3 lg:w-auto w-full"
      >
        {showIcons && <SignUpIcon />}
        <span>{signUpText}</span>
      </a>
    </div>
  );
};

// ============================================================================
// STYLED-COMPONENTS VERSION (Alternative)
// ============================================================================

/*
import styled from 'styled-components';

const ButtonContainer = styled.div`
  display: flex;
  align-items: center;
  gap: 16px;

  @media (max-width: 1024px) {
    flex-direction: column;
    gap: 12px;
    width: 100%;
  }
`;

const BaseButton = styled.a`
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  font-size: 14px;
  border-radius: 24px;
  cursor: pointer;
  text-decoration: none;
  transition: all 0.2s ease-out;
  min-height: 44px;

  svg {
    width: 18px;
    height: 18px;
    flex-shrink: 0;
  }

  @media (max-width: 1024px) {
    width: 100%;
  }

  @media (max-width: 640px) {
    padding-left: 16px;
    padding-right: 16px;
    font-size: 13px;
  }
`;

const PrimaryButtonStyled = styled(BaseButton)`
  position: relative;
  padding: 12px 24px;
  font-weight: 600;
  color: #FFFFFF;
  background: linear-gradient(135deg, #FF6B35 0%, #FF8C42 100%);
  border: none;
  overflow: hidden;

  &:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 12px rgba(255, 107, 53, 0.4);
  }

  &:active {
    transform: scale(0.98);
  }

  &:focus-visible {
    outline: 3px solid #FF6B35;
    outline-offset: 3px;
  }

  &::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.4);
    transform: translate(-50%, -50%);
    transition: width 0.6s, height 0.6s;
  }

  &:active::before {
    width: 300px;
    height: 300px;
  }
`;

const SecondaryButtonStyled = styled(BaseButton)`
  padding: 10px 22px;
  font-weight: 500;
  color: #2D5F5D;
  background: transparent;
  border: 2px solid #2D5F5D;

  &:hover {
    background: rgba(45, 95, 93, 0.1);
  }

  &:active {
    border-color: #1A3938;
  }

  &:focus-visible {
    outline: 3px solid #2D5F5D;
    outline-offset: 3px;
  }
`;

export const CTAButtonsStyled: React.FC<CTAButtonsProps> = ({
  loginHref = '/login',
  signUpHref = '/register',
  onLoginClick,
  onSignUpClick,
  loginText = 'Login',
  signUpText = 'Sign Up',
  showIcons = true,
}) => {
  return (
    <ButtonContainer>
      <SecondaryButtonStyled
        href={loginHref}
        onClick={onLoginClick}
        aria-label="Access your account"
        role="button"
      >
        {showIcons && <LoginIcon />}
        <span>{loginText}</span>
      </SecondaryButtonStyled>
      
      <PrimaryButtonStyled
        href={signUpHref}
        onClick={onSignUpClick}
        aria-label="Create new account"
        role="button"
      >
        {showIcons && <SignUpIcon />}
        <span>{signUpText}</span>
      </PrimaryButtonStyled>
    </ButtonContainer>
  );
};
*/

// ============================================================================
// EXPORTS
// ============================================================================

export default CTAButtons;
