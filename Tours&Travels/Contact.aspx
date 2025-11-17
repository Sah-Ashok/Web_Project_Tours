<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Tours_Travels.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <link rel="stylesheet" href="css/Contact.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">


    <!-- Success Toast Notification -->
    <div class="success-toast" id="successToast">
        <div class="toast-icon">
            <i class="bi bi-check-circle-fill"></i>
        </div>
        <div class="toast-content">
            <h4 class="toast-title">Message Sent!</h4>
            <p class="toast-message">We'll get back to you within 24 hours.</p>
        </div>
        <button type="button" class="toast-close" onclick="closeToast()">
            <i class="bi bi-x"></i>
        </button>
    </div>
    
    <!-- ==========================================
            PREMIUM HERO SECTION
            ========================================== -->
    <section class="contact-hero">
        <div class="hero-background">
            <div class="gradient-overlay"></div>
            <div class="diagonal-pattern"></div>
            <div class="floating-particles">
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
                <div class="particle"></div>
            </div>
        </div>
        
        <div class="hero-layout">
            <div class="hero-content-wrapper">
                <div class="hero-badge-pill" data-animate="fade-in">
                    <i class="bi bi-headset"></i>
                    <span>Premium Support</span>
                </div>
                
                <h1 class="hero-title" data-animate="fade-up">Get in Touch</h1>
                
                <p class="hero-description" data-animate="fade-up" data-delay="100">
                    Have questions? We're here to help. Reach out and we'll get back to you shortly.
                </p>
                
                <div class="hero-features" data-animate="cascade">
                    <div class="feature-card" data-hover="true">
                        <div class="feature-icon-wrapper">
                            <div class="icon-glow"></div>
                            <i class="bi bi-clock-history"></i>
                        </div>
                        <div class="feature-content">
                            <div class="feature-value">24/7</div>
                            <div class="feature-label">Support</div>
                        </div>
                    </div>
                    
                    <div class="feature-card" data-hover="true">
                        <div class="feature-icon-wrapper">
                            <div class="icon-glow"></div>
                            <i class="bi bi-lightning-charge"></i>
                        </div>
                        <div class="feature-content">
                            <div class="feature-value">&lt; 2h</div>
                            <div class="feature-label">Response Time</div>
                        </div>
                    </div>
                    
                    <div class="feature-card" data-hover="true">
                        <div class="feature-icon-wrapper">
                            <div class="icon-glow"></div>
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <div class="feature-content">
                            <div class="feature-value">99%</div>
                            <div class="feature-label">Satisfaction</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Premium Phone Mockup with Float Animation -->
            <div class="hero-phone-wrapper" data-animate="fade-scale">
                <div class="phone-glow-ring"></div>
                <div class="phone-device">
                    <div class="phone-notch"></div>
                    <div class="phone-screen">
                        <div class="screen-header">
                            <div class="status-bar">
                                <span class="time">9:41</span>
                                <div class="status-icons">
                                    <i class="bi bi-reception-4"></i>
                                    <i class="bi bi-wifi"></i>
                                    <i class="bi bi-battery-full"></i>
                                </div>
                            </div>
                        </div>
                        
                        <div class="call-screen">
                            <div class="call-avatar">
                                <div class="avatar-ring"></div>
                                <div class="avatar-image">
                                    <i class="bi bi-buildings"></i>
                                </div>
                            </div>
                            
                            <h3 class="caller-name">Exploria Tours</h3>
                            <p class="call-status">Calling...</p>
                            <div class="call-duration">00:00</div>
                            
                            <div class="call-actions">
                                <button type="button" class="action-button mute-btn">
                                    <i class="bi bi-mic-mute"></i>
                                </button>
                                <button type="button" class="action-button decline-btn">
                                    <i class="bi bi-telephone-x"></i>
                                </button>
                                <button type="button" class="action-button speaker-btn">
                                    <i class="bi bi-volume-up"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="scroll-indicator">
            <div class="scroll-mouse">
                <div class="scroll-wheel"></div>
            </div>
            <span class="scroll-text">Scroll to explore</span>
        </div>
    </section>

    <!-- ==========================================
            PREMIUM CONTACT FORM SECTION
            ========================================== -->
    <section class="contact-form-section">
        <div class="form-container">
            <div class="form-layout">
                <!-- Left Side - Enhanced Contact Form -->
                <div class="premium-form-card" data-animate="slide-in-left">
                    <div class="form-header-section">
                        <div class="form-icon-badge">
                            <i class="bi bi-envelope-paper-heart"></i>
                        </div>
                        <h2 class="form-main-title">Send Us a Message</h2>
                        <p class="form-main-subtitle">Fill out the form below and our team will get back to you within 24 hours</p>
                    </div>
                    
                    <div class="luxury-form">
                        <!-- Name Input -->
                        <div class="form-field">
                            <div class="field-icon">
                                <i class="bi bi-person"></i>
                            </div>
                            <div class="field-wrapper">
                                <asp:TextBox ID="txtName" runat="server" CssClass="luxury-input" placeholder=" "></asp:TextBox>
                                <label class="luxury-label">Your Name</label>
                                <span class="field-underline"></span>
                            </div>
                        </div>
                        
                        <!-- Email Input -->
                        <div class="form-field">
                            <div class="field-icon">
                                <i class="bi bi-envelope"></i>
                            </div>
                            <div class="field-wrapper">
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="luxury-input" placeholder=" "></asp:TextBox>
                                <label class="luxury-label">Email Address</label>
                                <span class="field-underline"></span>
                            </div>
                        </div>
                        
                        <!-- Phone Input (Matches txtPhone in .cs) -->
                        <div class="form-field">
                            <div class="field-icon">
                                <i class="bi bi-telephone"></i>
                            </div>
                            <div class="field-wrapper">
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="luxury-input" placeholder=" "></asp:TextBox>
                                <label class="luxury-label">Phone Number</label>
                                <span class="field-underline"></span>
                            </div>
                        </div>
                        
                        <!-- Subject Dropdown (Matches ddlSubject in .cs) -->
                        <div class="form-field">
                            <div class="field-icon">
                                <i class="bi bi-chat-left-text"></i>
                            </div>
                            <div class="field-wrapper">
                                <asp:DropDownList ID="txtSubject" runat="server" CssClass="luxury-select">
                                    <asp:ListItem Text="Select a Subject" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="General Inquiry" Value="general"></asp:ListItem>
                                    <asp:ListItem Text="Tour Booking" Value="booking"></asp:ListItem>
                                    <asp:ListItem Text="Visa Assistance" Value="visa"></asp:ListItem>
                                    <asp:ListItem Text="Payment Issue" Value="payment"></asp:ListItem>
                                    <asp:ListItem Text="Feedback" Value="feedback"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                                </asp:DropDownList>
                                <label class="luxury-label select-label">Subject</label>
                                <span class="field-underline"></span>
                            </div>
                        </div>
                        
                        <!-- Message Textarea (Matches txtMessage in .cs) -->
                        <div class="form-field textarea-field">
                            <div class="field-icon">
                                <i class="bi bi-pencil-square"></i>
                            </div>
                            <div class="field-wrapper">
                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="luxury-textarea" placeholder=" "></asp:TextBox>
                                <label class="luxury-label">Your Message</label>
                                <span class="field-underline"></span>
                            </div>
                        </div>
                        
                        <!-- Submit Button (Matches btnSubmit and OnClick="btnSubmit_Click" in .cs) -->
                        <div class="form-submit-wrapper">
                            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="luxury-submit-btn" OnClick="btnSubmit_Click" />
                            <div class="submit-glow"></div>
                        </div>
                        
                        <!-- Message Label (Matches lblMessage in .cs) -->
                        <asp:Label ID="lblMessage" runat="server" CssClass="form-status-message" Visible="false"></asp:Label>
                        
                        <!-- Security Note -->
                        <div class="form-security-note">
                            <i class="bi bi-shield-check"></i>
                            <span>Your information is secure and will never be shared</span>
                        </div>
                    </div>
                </div>
                
                <!-- Right Side - Unified Contact Info Cards -->
                <div class="contact-info-sidebar">
                    <!-- Office Location -->
                    <div class="info-luxury-card" data-animate="fade-up" data-delay="100">
                        <div class="info-icon-wrapper">
                            <div class="icon-bg-circle"></div>
                            <i class="bi bi-geo-alt-fill"></i>
                        </div>
                        <h3 class="info-card-title">Visit Our Office</h3>
                        <p class="info-card-text">130 Feet Ring Road, Rajkot<br>Gujarat, India - 360005</p>
                        <a href="#map-section" class="info-card-link">
                            <span>View on Map</span>
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                    
                    <!-- Operating Hours -->
                    <div class="info-luxury-card" data-animate="fade-up" data-delay="200">
                        <div class="info-icon-wrapper">
                            <div class="icon-bg-circle"></div>
                            <i class="bi bi-clock"></i>
                        </div>
                        <h3 class="info-card-title">Operating Hours</h3>
                        <div class="hours-grid">
                            <div class="hour-row">
                                <span class="day-label">Mon - Sat</span>
                                <span class="time-value">9:00 AM - 7:00 PM</span>
                            </div>
                            <div class="hour-row">
                                <span class="day-label">Sunday</span>
                                <span class="time-value closed">Closed</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Contact Details -->
                    <div class="info-luxury-card" data-animate="fade-up" data-delay="300">
                        <div class="info-icon-wrapper">
                            <div class="icon-bg-circle"></div>
                            <i class="bi bi-telephone-fill"></i>
                        </div>
                        <h3 class="info-card-title">Phone</h3>
                        <a href="tel:+919876543210" class="contact-link-btn">
                            <i class="bi bi-telephone"></i>
                            <span>+91 98765 43210</span>
                        </a>
                    </div>
                    
                    <!-- Email -->
                    <div class="info-luxury-card" data-animate="fade-up" data-delay="400">
                        <div class="info-icon-wrapper">
                            <div class="icon-bg-circle"></div>
                            <i class="bi bi-envelope-fill"></i>
                        </div>
                        <h3 class="info-card-title">Email</h3>
                        <a href="mailto:contact@exploriatours.com" class="contact-link-btn">
                            <i class="bi bi-envelope"></i>
                            <span>contact@exploriatours.com</span>
                        </a>
                    </div>
                    
                    <!-- Social Media -->
                    <div class="social-luxury-card" data-animate="fade-up" data-delay="500">
                        <h3 class="social-card-title">Connect With Us</h3>
                        <div class="social-icons-grid">
                            <a href="#" class="social-icon-btn" title="Facebook">
                                <i class="bi bi-facebook"></i>
                            </a>
                            <a href="#" class="social-icon-btn" title="Instagram">
                                <i class="bi bi-instagram"></i>
                            </a>
                            <a href="#" class="social-icon-btn" title="Twitter">
                                <i class="bi bi-twitter"></i>
                            </a>
                            <a href="#" class="social-icon-btn" title="LinkedIn">
                                <i class="bi bi-linkedin"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
            ENHANCED MAP SECTION
            ========================================== -->
    <section class="map-section" id="map-section">
        <div class="map-section-header">
            <div class="section-badge">
                <i class="bi bi-pin-map"></i>
                <span>Location</span>
            </div>
            <h2 class="map-section-title">Find Us Here</h2>
            <p class="map-section-subtitle">Visit our office or reach out online</p>
        </div>
        
        <div class="map-wrapper-enhanced">
            <div id="contactMap" class="interactive-map"></div>
            <div class="map-info-overlay">
                <div class="overlay-icon-badge">
                    <i class="bi bi-geo-alt-fill"></i>
                </div>
                <h3 class="overlay-location-name">Exploria Tours</h3>
                <p class="overlay-location-address">130 Feet Ring Road, Rajkot<br>Gujarat, India - 360005</p>
                <a href="https://maps.google.com/?q=130+Feet+Ring+Road+Rajkot" target="_blank" class="directions-btn">
                    <i class="bi bi-compass"></i>
                    <span>Get Directions</span>
                </a>
            </div>
        </div>
    </section>

    <!-- ==========================================
            ENHANCED FAQ SECTION
            ========================================== -->
    <section class="faq-section">
        <div class="faq-container">
            <div class="faq-header">
                <div class="section-badge">
                    <i class="bi bi-question-circle"></i>
                    <span>FAQ</span>
                </div>
                <h2 class="faq-section-title">Quick Answers</h2>
                <p class="faq-section-subtitle">Find instant answers to common questions</p>
            </div>
            
            <div class="faq-grid-enhanced">
                <div class="faq-luxury-card" data-animate="zoom-in" data-delay="0">
                    <div class="faq-icon-wrapper">
                        <div class="faq-icon-bg"></div>
                        <i class="bi bi-calendar-check"></i>
                    </div>
                    <h3 class="faq-card-question">
                        How do I book a tour?
                        <i class="bi bi-plus-circle faq-expand-icon"></i>
                    </h3>
                    <p class="faq-card-answer">Browse our destinations, select your preferred tour, and complete the secure online booking form with your details</p>
                </div>
                
                <div class="faq-luxury-card" data-animate="zoom-in" data-delay="100">
                    <div class="faq-icon-wrapper">
                        <div class="faq-icon-bg"></div>
                        <i class="bi bi-credit-card-2-front"></i>
                    </div>
                    <h3 class="faq-card-question">
                        What payment methods?
                        <i class="bi bi-plus-circle faq-expand-icon"></i>
                    </h3>
                    <p class="faq-card-answer">We accept all major credit cards, debit cards, net banking, UPI, and secure online payment gateways</p>
                </div>
                
                <div class="faq-luxury-card" data-animate="zoom-in" data-delay="200">
                    <div class="faq-icon-wrapper">
                        <div class="faq-icon-bg"></div>
                        <i class="bi bi-x-circle"></i>
                    </div>
                    <h3 class="faq-card-question">
                        Cancellation policy?
                        <i class="bi bi-plus-circle faq-expand-icon"></i>
                    </h3>
                    <p class="faq-card-answer">Free cancellation up to 48 hours before departure with full refund. Flexible rescheduling options available</p>
                </div>
                
                <div class="faq-luxury-card" data-animate="zoom-in" data-delay="300">
                    <div class="faq-icon-wrapper">
                        <div class="faq-icon-bg"></div>
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <h3 class="faq-card-question">
                        Is my data secure?
                        <i class="bi bi-plus-circle faq-expand-icon"></i>
                    </h3>
                    <p class="faq-card-answer">Yes, we use industry-standard 256-bit SSL encryption and secure payment gateways to protect your information</p>
                </div>
            </div>
        </div>
    </section>
</form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {

            // Intersection Observer for animations
            const observerOptions = {
                threshold: 0.15,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const delay = entry.target.dataset.delay || 0;
                        setTimeout(() => {
                            entry.target.classList.add('animated');
                        }, delay);
                    }
                });
            }, observerOptions);

            document.querySelectorAll('[data-animate]').forEach(el => {
                observer.observe(el);
            });

            // Floating Labels
            const formInputs = document.querySelectorAll('.luxury-input, .luxury-textarea, .luxury-select');
            formInputs.forEach(input => {
                if (input.value) {
                    input.closest('.field-wrapper').classList.add('active');
                }

                input.addEventListener('focus', function () {
                    this.closest('.field-wrapper').classList.add('focused');
                });

                input.addEventListener('blur', function () {
                    this.closest('.field-wrapper').classList.remove('focused');
                });
            });

            // Phone call timer
            let seconds = 0;
            setInterval(() => {
                seconds++;
                const mins = Math.floor(seconds / 60);
                const secs = seconds % 60;
                const timerEl = document.querySelector('.call-duration');
                if (timerEl) {
                    timerEl.textContent = String(mins).padStart(2, '0') + ':' + String(secs).padStart(2, '0');
                }
            }, 1000);

            // Initialize Map with Bouncing Pin
            const mapElement = document.getElementById('contactMap');
            if (mapElement) {
                const lat = 22.3039;
                const lng = 70.8022;

                const map = L.map('contactMap', {
                    zoomControl: false
                }).setView([lat, lng], 15);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; OpenStreetMap contributors'
                }).addTo(map);

                const customIcon = L.divIcon({
                    className: 'custom-map-marker',
                    html: '<div class="marker-pin bounce-pin"><i class="bi bi-geo-alt-fill"></i></div>',
                    iconSize: [40, 40]
                });

                const marker = L.marker([lat, lng], { icon: customIcon }).addTo(map);
                marker.bindPopup('<div style="text-align: center; font-weight: 600;"><b>Exploria Tours</b><br>130 Feet Ring Road<br>Rajkot, Gujarat</div>');

                setTimeout(() => marker.openPopup(), 800);
            }

        });

        // Toast Functions
        function showToast() {
            const toast = document.getElementById('successToast');
            toast.classList.add('show');
            setTimeout(() => {
                toast.classList.remove('show');
            }, 5000);
        }

        function closeToast() {
            const toast = document.getElementById('successToast');
            toast.classList.remove('show');
        }
    </script>
</asp:Content>