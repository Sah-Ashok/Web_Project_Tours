<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Tours_Travels.About" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/About.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="about-main">
        <!-- Animated Particle Background -->
        <div class="particle-container">
            <canvas id="particleCanvas"></canvas>
        </div>

        <!-- Floating Decorative Elements -->
        <div class="floating-elements">
            <div class="float-element element-1"></div>
            <div class="float-element element-2"></div>
            <div class="float-element element-3"></div>
            <div class="float-element element-4"></div>
        </div>

        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-parallax-layer layer-1"></div>
            <div class="hero-parallax-layer layer-2"></div>
            <div class="hero-parallax-layer layer-3"></div>

            <div class="hero-content">
                <div class="glass-morphism-card" data-aos="zoom-in" data-aos-duration="1000">
                    <div class="card-glow-effect"></div>
                    <span class="hero-label">Welcome To</span>
                    <h1 class="hero-title">
                        <span class="title-line">About Exploria</span>
                        <span class="title-line gradient-text">Tours</span>
                    </h1>
                    <p class="hero-subtitle">Crafting unforgettable journeys with passion and expertise since 2015.</p>
                    <div class="hero-divider">
                        <span class="divider-dot"></span>
                        <span class="divider-line"></span>
                        <span class="divider-dot"></span>
                    </div>
                </div>
            </div>

            <div class="scroll-indicator">
                <div class="scroll-mouse">
                    <div class="scroll-wheel"></div>
                </div>
                <span class="scroll-text">Scroll to explore</span>
            </div>

            <!-- Gradient Transition Overlay -->
            <div class="section-transition-gradient bottom"></div>
        </section>

        <!-- Our Story Section -->
        <section class="story-section section-reveal">
            <div class="container">
                <!-- Decorative Line -->
                <div class="decorative-line top" data-aos="fade-right" data-aos-duration="1000"></div>

                <div class="story-layout">
                    <div class="story-image-block" data-aos="fade-right" data-aos-duration="1200">
                        <div class="image-container magnetic-element">
                            <div class="image-border-animation"></div>
                            <img src="https://images.unsplash.com/photo-1522199755839-a2bacb67c546?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
                                alt="Travel planning session"
                                class="story-img">
                            <div class="image-overlay-gradient"></div>
                            <div class="image-shine-effect"></div>
                        </div>

                        <div class="floating-stat-badge">
                            <div class="badge-icon">
                                <i class="bi bi-award-fill"></i>
                            </div>
                            <div class="badge-content">
                                <span class="badge-number">10+</span>
                                <span class="badge-label">Years Excellence</span>
                            </div>
                        </div>

                        <div class="deco-circle deco-1"></div>
                        <div class="deco-circle deco-2"></div>
                    </div>

                    <div class="story-content-block" data-aos="fade-left" data-aos-duration="1200" data-aos-delay="200">
                        <div class="section-badge">
                            <span class="badge-icon-small"><i class="bi bi-bookmark-star"></i></span>
                            <span class="badge-text">Our Journey</span>
                        </div>

                        <h2 class="section-heading">
                            <span class="heading-main">Our Story</span>
                            <span class="heading-underline"></span>
                        </h2>

                        <div class="story-text-wrapper">
                            <p class="story-paragraph reveal-on-scroll" data-aos="fade-up" data-aos-delay="300">
                                Exploria Tours was born from a <span class="highlight-text">simple yet profound love for exploration</span>. Founded in 2015, our journey began with a small team of <span class="highlight-text">passionate travelers</span> who believed that travel should be more than just visiting a place; it should be an <span class="highlight-text">experience that transforms you</span>.
                            </p>

                            <p class="story-paragraph reveal-on-scroll" data-aos="fade-up" data-aos-delay="400">
                                We started with a mission to create <span class="highlight-text">authentic, immersive, and sustainable</span> travel experiences that connect travelers with the heart and soul of a destination. Today, we've grown into a <span class="highlight-text">leading travel company</span>, but our core philosophy remains the same: to share the magic of travel and create <span class="highlight-text">memories that last a lifetime</span>.
                            </p>
                        </div>

                        <div class="stats-showcase" data-aos="fade-up" data-aos-delay="500">
                            <div class="stat-box">
                                <div class="stat-icon">
                                    <i class="bi bi-people-fill"></i>
                                </div>
                                <div class="stat-info">
                                    <span class="stat-value" data-count="10000">0</span><span class="stat-plus">+</span>
                                    <span class="stat-title">Happy Travelers</span>
                                </div>
                                <div class="stat-progress">
                                    <div class="progress-fill"></div>
                                </div>
                            </div>

                            <div class="stat-box">
                                <div class="stat-icon">
                                    <i class="bi bi-geo-alt-fill"></i>
                                </div>
                                <div class="stat-info">
                                    <span class="stat-value" data-count="150">0</span><span class="stat-plus">+</span>
                                    <span class="stat-title">Destinations</span>
                                </div>
                                <div class="stat-progress">
                                    <div class="progress-fill"></div>
                                </div>
                            </div>

                            <div class="stat-box">
                                <div class="stat-icon">
                                    <i class="bi bi-trophy-fill"></i>
                                </div>
                                <div class="stat-info">
                                    <span class="stat-value" data-count="98">0</span><span class="stat-plus">%</span>
                                    <span class="stat-title">Success Rate</span>
                                </div>
                                <div class="stat-progress">
                                    <div class="progress-fill"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Gradient Transition Overlay -->
            <div class="section-transition-gradient bottom"></div>
        </section>

        <!-- Mission & Vision Section -->
        <section class="mission-vision-section section-reveal">
            <div class="container">
                <!-- Decorative Pattern -->
                <div class="decorative-pattern top-right" data-aos="fade-left"></div>

                <div class="section-title-wrapper" data-aos="fade-up">
                    <div class="section-badge center">
                        <span class="badge-icon-small"><i class="bi bi-compass-fill"></i></span>
                        <span class="badge-text">Our Direction</span>
                    </div>
                    <h2 class="section-heading center">
                        <span class="heading-main">Mission & Vision</span>
                        <span class="heading-underline center"></span>
                    </h2>
                </div>

                <div class="mission-vision-grid">
                    <div class="mv-card parallax-card" data-aos="fade-right" data-aos-duration="1000">
                        <div class="mv-card-inner">
                            <div class="mv-icon-wrapper">
                                <div class="mv-icon mission-icon">
                                    <i class="bi bi-bullseye"></i>
                                </div>
                            </div>
                            <h3 class="mv-title">Our Mission</h3>
                            <p class="mv-description">
                                To create authentic, immersive, and sustainable travel experiences that connect travelers with the heart and soul of every destination, while supporting local communities and preserving cultural heritage for future generations.
                            </p>
                            <div class="mv-decoration"></div>
                        </div>
                    </div>

                    <div class="mv-card parallax-card" data-aos="fade-left" data-aos-duration="1000" data-aos-delay="200">
                        <div class="mv-card-inner">
                            <div class="mv-icon-wrapper">
                                <div class="mv-icon vision-icon">
                                    <i class="bi bi-eye-fill"></i>
                                </div>
                            </div>
                            <h3 class="mv-title">Our Vision</h3>
                            <p class="mv-description">
                                To become the world's most trusted and innovative travel partner, inspiring millions to explore responsibly, discover authentically, and create meaningful connections across cultures and continents.
                            </p>
                            <div class="mv-decoration"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Gradient Transition Overlay -->
            <div class="section-transition-gradient bottom"></div>
        </section>

        <!-- Values Section -->
        <section class="values-section section-reveal">
            <div class="values-bg-layer">
                <div class="gradient-orb orb-1"></div>
                <div class="gradient-orb orb-2"></div>
                <div class="gradient-orb orb-3"></div>
            </div>

            <div class="container">
                <!-- Decorative Dots -->
                <div class="decorative-dots-grid" data-aos="fade"></div>

                <div class="section-title-wrapper" data-aos="fade-up">
                    <div class="section-badge center">
                        <span class="badge-icon-small"><i class="bi bi-stars"></i></span>
                        <span class="badge-text">What Drives Us</span>
                    </div>
                    <h2 class="section-heading center">
                        <span class="heading-main">Our Core Values</span>
                        <span class="heading-underline center"></span>
                    </h2>
                    <p class="section-description">The principles that guide every journey we craft.</p>
                </div>

                <div class="values-grid">
                    <div class="value-card-modern" data-aos="flip-up" data-aos-delay="100" data-aos-duration="800">
                        <div class="card-inner">
                            <div class="card-background-effect"></div>
                            <div class="card-border-glow"></div>

                            <div class="value-icon-modern">
                                <div class="icon-outer-ring"></div>
                                <div class="icon-inner-circle">
                                    <i class="bi bi-compass"></i>
                                </div>
                                <div class="icon-particles">
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                </div>
                            </div>

                            <h3 class="value-heading">Passion for Adventure</h3>
                            <p class="value-text">We are explorers at heart, driven to uncover the world's wonders and share them with you.</p>

                            <div class="card-hover-overlay"></div>
                            <div class="card-shine-sweep"></div>
                        </div>
                    </div>

                    <div class="value-card-modern" data-aos="flip-up" data-aos-delay="200" data-aos-duration="800">
                        <div class="card-inner">
                            <div class="card-background-effect"></div>
                            <div class="card-border-glow"></div>

                            <div class="value-icon-modern">
                                <div class="icon-outer-ring"></div>
                                <div class="icon-inner-circle">
                                    <i class="bi bi-shield-check"></i>
                                </div>
                                <div class="icon-particles">
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                </div>
                            </div>

                            <h3 class="value-heading">Commitment to Quality</h3>
                            <p class="value-text">From expert guides to premium accommodations, we ensure excellence in every detail of your trip.</p>

                            <div class="card-hover-overlay"></div>
                            <div class="card-shine-sweep"></div>
                        </div>
                    </div>

                    <div class="value-card-modern" data-aos="flip-up" data-aos-delay="300" data-aos-duration="800">
                        <div class="card-inner">
                            <div class="card-background-effect"></div>
                            <div class="card-border-glow"></div>

                            <div class="value-icon-modern">
                                <div class="icon-outer-ring"></div>
                                <div class="icon-inner-circle">
                                    <i class="bi bi-tree"></i>
                                </div>
                                <div class="icon-particles">
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                    <span class="particle"></span>
                                </div>
                            </div>

                            <h3 class="value-heading">Sustainable Travel</h3>
                            <p class="value-text">We are dedicated to responsible tourism that respects local cultures and protects the environment.</p>

                            <div class="card-hover-overlay"></div>
                            <div class="card-shine-sweep"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Gradient Transition Overlay -->
            <div class="section-transition-gradient bottom"></div>
        </section>

        <!-- Awards & Recognition Section -->
        <section class="awards-section section-reveal">
            <div class="container">
                <!-- Decorative Line -->
                <div class="decorative-line bottom" data-aos="fade-left" data-aos-duration="1000"></div>

                <div class="section-title-wrapper" data-aos="fade-up">
                    <div class="section-badge center">
                        <span class="badge-icon-small"><i class="bi bi-award"></i></span>
                        <span class="badge-text">Excellence Recognized</span>
                    </div>
                    <h2 class="section-heading center">
                        <span class="heading-main">Awards & Recognition</span>
                        <span class="heading-underline center"></span>
                    </h2>
                    <p class="section-description">Honored for our commitment to exceptional travel experiences.</p>
                </div>

                <div class="awards-grid">
                    <div class="award-card" data-aos="zoom-in" data-aos-delay="100">
                        <div class="award-icon">
                            <i class="bi bi-trophy-fill"></i>
                        </div>
                        <h4 class="award-title">Best Travel Agency 2024</h4>
                        <p class="award-org">Travel Excellence Awards</p>
                    </div>

                    <div class="award-card" data-aos="zoom-in" data-aos-delay="200">
                        <div class="award-icon">
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <h4 class="award-title">5-Star Customer Service</h4>
                        <p class="award-org">TripAdvisor Excellence</p>
                    </div>

                    <div class="award-card" data-aos="zoom-in" data-aos-delay="300">
                        <div class="award-icon">
                            <i class="bi bi-patch-check-fill"></i>
                        </div>
                        <h4 class="award-title">Sustainable Tourism Leader</h4>
                        <p class="award-org">Green Travel Certification</p>
                    </div>

                    <div class="award-card" data-aos="zoom-in" data-aos-delay="400">
                        <div class="award-icon">
                            <i class="bi bi-gem"></i>
                        </div>
                        <h4 class="award-title">Top Innovation Award</h4>
                        <p class="award-org">Tourism Innovation Summit</p>
                    </div>
                </div>
            </div>

            <!-- Gradient Transition Overlay -->
            <div class="section-transition-gradient bottom"></div>
        </section>

        <!-- Team Section -->
        <section class="team-section section-reveal">
            <div class="container">
                <!-- Decorative Pattern -->
                <div class="decorative-pattern bottom-left" data-aos="fade-right"></div>

                <div class="section-title-wrapper" data-aos="fade-up">
                    <div class="section-badge center">
                        <span class="badge-icon-small"><i class="bi bi-people"></i></span>
                        <span class="badge-text">The Experts</span>
                    </div>
                    <h2 class="section-heading center">
                        <span class="heading-main">Meet Our Expert Team</span>
                        <span class="heading-underline center"></span>
                    </h2>
                    <p class="section-description">The passionate professionals behind your perfect vacation.</p>
                </div>

                <div class="team-grid-modern">
                    <!-- Team Member 1 -->
                    <div class="team-card-3d" data-aos="zoom-in-up" data-aos-delay="100" data-aos-duration="1000">
                        <div class="card-3d-wrapper">
                            <div class="card-3d-inner">
                                <div class="card-face card-front">
                                    <div class="member-image-wrapper">
                                        <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                                            alt="Zaid Amreliya"
                                            class="member-image">
                                        <div class="image-gradient-overlay"></div>
                                    </div>

                                    <div class="member-info-panel">
                                        <div class="info-badge">
                                            <i class="bi bi-star-fill"></i>
                                        </div>
                                        <h3 class="member-name">Zaid Amreliya</h3>
                                        <p class="member-position">Founder & CEO</p>

                                        <div class="social-links-horizontal">
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-linkedin"></i>
                                            </a>
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-twitter"></i>
                                            </a>
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-envelope-fill"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="card-corner-decoration top-left"></div>
                                    <div class="card-corner-decoration top-right"></div>
                                    <div class="card-corner-decoration bottom-left"></div>
                                    <div class="card-corner-decoration bottom-right"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Team Member 2 -->
                    <div class="team-card-3d" data-aos="zoom-in-up" data-aos-delay="200" data-aos-duration="1000">
                        <div class="card-3d-wrapper">
                            <div class="card-3d-inner">
                                <div class="card-face card-front">
                                    <div class="member-image-wrapper">
                                        <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                                            alt="Ashok Sah"
                                            class="member-image">
                                        <div class="image-gradient-overlay"></div>
                                    </div>

                                    <div class="member-info-panel">
                                        <div class="info-badge">
                                            <i class="bi bi-star-fill"></i>
                                        </div>
                                        <h3 class="member-name">Ashok Sah</h3>
                                        <p class="member-position">Co-Founder & COO</p>

                                        <div class="social-links-horizontal">
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-linkedin"></i>
                                            </a>
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-instagram"></i>
                                            </a>
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-envelope-fill"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="card-corner-decoration top-left"></div>
                                    <div class="card-corner-decoration top-right"></div>
                                    <div class="card-corner-decoration bottom-left"></div>
                                    <div class="card-corner-decoration bottom-right"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Team Member 3 -->
                    <div class="team-card-3d" data-aos="zoom-in-up" data-aos-delay="300" data-aos-duration="1000">
                        <div class="card-3d-wrapper">
                            <div class="card-3d-inner">
                                <div class="card-face card-front">
                                    <div class="member-image-wrapper">
                                        <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                                            alt="Maria Garcia"
                                            class="member-image">
                                        <div class="image-gradient-overlay"></div>
                                    </div>

                                    <div class="member-info-panel">
                                        <div class="info-badge">
                                            <i class="bi bi-star-fill"></i>
                                        </div>
                                        <h3 class="member-name">Maria Garcia</h3>
                                        <p class="member-position">Head of Destinations</p>

                                        <div class="social-links-horizontal">
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-linkedin"></i>
                                            </a>
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-twitter"></i>
                                            </a>
                                            <a href="#" class="social-btn">
                                                <i class="bi bi-envelope-fill"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="card-corner-decoration top-left"></div>
                                    <div class="card-corner-decoration top-right"></div>
                                    <div class="card-corner-decoration bottom-left"></div>
                                    <div class="card-corner-decoration bottom-right"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Gradient Transition Overlay -->
            <div class="section-transition-gradient bottom"></div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section-modern">
            <div class="liquid-bg">
                <svg class="liquid-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
                    <path class="liquid-path" fill="url(#liquidGradient)" fill-opacity="0.3" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,144C960,149,1056,139,1152,122.7C1248,107,1344,85,1392,74.7L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z">
                        <animate attributeName="d" dur="10s" repeatCount="indefinite"
                            values="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,144C960,149,1056,139,1152,122.7C1248,107,1344,85,1392,74.7L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;
                            M0,160L48,170.7C96,181,192,203,288,192C384,181,480,139,576,128C672,117,768,139,864,154.7C960,171,1056,181,1152,170.7C1248,160,1344,128,1392,112L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;
                            M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,144C960,149,1056,139,1152,122.7C1248,107,1344,85,1392,74.7L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z" />
                    </path>
                    <defs>
                        <linearGradient id="liquidGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                            <stop offset="0%" style="stop-color: rgba(29,94,51,0.4); stop-opacity: 1" />
                            <stop offset="100%" style="stop-color: rgba(42,125,74,0.6); stop-opacity: 1" />
                        </linearGradient>
                    </defs>
                </svg>
            </div>

            <div class="cta-glow-orbs">
                <div class="glow-orb orb-a"></div>
                <div class="glow-orb orb-b"></div>
            </div>

            <div class="container" data-aos="fade-up" data-aos-duration="1000">
                <div class="cta-content-box">
                    <span class="cta-label">Start Your Journey</span>
                    <h2 class="cta-heading">Ready for Your Next Adventure?</h2>
                    <p class="cta-description">Browse our curated collection of destinations and start planning the trip of a lifetime.</p>

                    <a href="Destinations.aspx" class="cta-btn-modern">
                        <span class="btn-content">
                            <span class="btn-text">Explore Destinations</span>
                            <span class="btn-arrow">
                                <i class="bi bi-arrow-right"></i>
                            </span>
                        </span>
                        <div class="btn-bg-effect"></div>
                        <div class="btn-particles">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </a>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {

            // Particle Background
            const canvas = document.getElementById('particleCanvas');
            if (canvas) {
                const ctx = canvas.getContext('2d');
                canvas.width = window.innerWidth;
                canvas.height = window.innerHeight;

                const particlesArray = [];
                const numberOfParticles = 80;

                class Particle {
                    constructor() {
                        this.x = Math.random() * canvas.width;
                        this.y = Math.random() * canvas.height;
                        this.size = Math.random() * 3 + 1;
                        this.speedX = Math.random() * 0.5 - 0.25;
                        this.speedY = Math.random() * 0.5 - 0.25;
                        this.opacity = Math.random() * 0.5 + 0.2;
                    }

                    update() {
                        this.x += this.speedX;
                        this.y += this.speedY;
                        if (this.x > canvas.width) this.x = 0;
                        if (this.x < 0) this.x = canvas.width;
                        if (this.y > canvas.height) this.y = 0;
                        if (this.y < 0) this.y = canvas.height;
                    }

                    draw() {
                        ctx.fillStyle = `rgba(29, 94, 51, ${this.opacity})`;
                        ctx.beginPath();
                        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                        ctx.fill();
                    }
                }

                function init() {
                    for (let i = 0; i < numberOfParticles; i++) {
                        particlesArray.push(new Particle());
                    }
                }

                function animate() {
                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                    particlesArray.forEach(particle => {
                        particle.update();
                        particle.draw();
                    });
                    connectParticles();
                    requestAnimationFrame(animate);
                }

                function connectParticles() {
                    for (let i = 0; i < particlesArray.length; i++) {
                        for (let j = i + 1; j < particlesArray.length; j++) {
                            const dx = particlesArray[i].x - particlesArray[j].x;
                            const dy = particlesArray[i].y - particlesArray[j].y;
                            const distance = Math.sqrt(dx * dx + dy * dy);
                            if (distance < 120) {
                                ctx.strokeStyle = `rgba(29, 94, 51, ${0.2 - distance / 600})`;
                                ctx.lineWidth = 1;
                                ctx.beginPath();
                                ctx.moveTo(particlesArray[i].x, particlesArray[i].y);
                                ctx.lineTo(particlesArray[j].x, particlesArray[j].y);
                                ctx.stroke();
                            }
                        }
                    }
                }

                window.addEventListener('resize', function () {
                    canvas.width = window.innerWidth;
                    canvas.height = window.innerHeight;
                });

                init();
                animate();
            }

            // Parallax Layers
            const heroLayers = document.querySelectorAll('.hero-parallax-layer');
            window.addEventListener('scroll', function () {
                const scrolled = window.pageYOffset;
                heroLayers.forEach((layer, index) => {
                    const speed = (index + 1) * 0.3;
                    layer.style.transform = `translateY(${scrolled * speed}px)`;
                });
            });

            // Parallax Cards
            const parallaxCards = document.querySelectorAll('.parallax-card');
            window.addEventListener('scroll', function () {
                parallaxCards.forEach(card => {
                    const rect = card.getBoundingClientRect();
                    const scrollPercent = (window.innerHeight - rect.top) / window.innerHeight;
                    if (scrollPercent > 0 && scrollPercent < 1) {
                        const moveY = (scrollPercent - 0.5) * 30;
                        card.style.transform = `translateY(${moveY}px)`;
                    }
                });
            });

            // Counter Animation
            function animateCounter(element, start, end, duration) {
                let startTime = null;
                function animation(currentTime) {
                    if (startTime === null) startTime = currentTime;
                    const progress = Math.min((currentTime - startTime) / duration, 1);
                    const value = Math.floor(progress * (end - start) + start);
                    element.textContent = value.toLocaleString();
                    if (progress < 1) {
                        requestAnimationFrame(animation);
                    }
                }
                requestAnimationFrame(animation);
            }

            const statObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
                        entry.target.classList.add('counted');
                        const target = parseInt(entry.target.getAttribute('data-count'));
                        animateCounter(entry.target, 0, target, 2000);
                        const progressBar = entry.target.closest('.stat-box').querySelector('.progress-fill');
                        if (progressBar) {
                            progressBar.style.width = '100%';
                        }
                    }
                });
            }, { threshold: 0.5 });

            document.querySelectorAll('.stat-value').forEach(stat => {
                statObserver.observe(stat);
            });

            // Magnetic Effect
            const magneticElements = document.querySelectorAll('.magnetic-element');
            magneticElements.forEach(element => {
                element.addEventListener('mousemove', function (e) {
                    const rect = element.getBoundingClientRect();
                    const x = e.clientX - rect.left - rect.width / 2;
                    const y = e.clientY - rect.top - rect.height / 2;
                    element.style.transform = `perspective(1000px) rotateY(${x / 20}deg) rotateX(${-y / 20}deg) scale(1.02)`;
                });
                element.addEventListener('mouseleave', function () {
                    element.style.transform = 'perspective(1000px) rotateY(0) rotateX(0) scale(1)';
                });
            });

            // 3D Tilt for Team Cards
            const teamCards = document.querySelectorAll('.team-card-3d');
            teamCards.forEach(card => {
                const wrapper = card.querySelector('.card-3d-wrapper');
                card.addEventListener('mousemove', function (e) {
                    const rect = card.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;
                    const centerX = rect.width / 2;
                    const centerY = rect.height / 2;
                    const rotateX = (y - centerY) / 10;
                    const rotateY = (centerX - x) / 10;
                    wrapper.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.05, 1.05, 1.05)`;
                });
                card.addEventListener('mouseleave', function () {
                    wrapper.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) scale3d(1, 1, 1)';
                });
            });

            // Value Cards Ripple
            const valueCards = document.querySelectorAll('.value-card-modern');
            valueCards.forEach(card => {
                card.addEventListener('mouseenter', function (e) {
                    const rect = card.getBoundingClientRect();
                    const x = e.clientX - rect.left;
                    const y = e.clientY - rect.top;
                    const ripple = document.createElement('div');
                    ripple.className = 'ripple-animation';
                    ripple.style.left = x + 'px';
                    ripple.style.top = y + 'px';
                    card.appendChild(ripple);
                    setTimeout(() => ripple.remove(), 1000);
                });
            });

        });
    </script>
</asp:Content>

