<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web_Project_Tours.index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <main class="main">

        <!-- Travel Hero Section -->
        <section id="travel-hero" class="travel-hero section dark-background">

            <div class="hero-background">
                <video autoplay="" muted="" loop="">
                    <source src="assets/img/travel/video-2.mp4" type="video/mp4">
                </video>
                <div class="hero-overlay"></div>
            </div>

            <div class="container position-relative">
                <div class="row align-items-center">
                    <div class="col-lg-7">
                        <div class="hero-text" data-aos="fade-up" data-aos-delay="100">
                            <h1 class="hero-title">Discover Your Perfect Journey</h1>
                            <p class="hero-subtitle">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                            <div class="hero-buttons">
                                <a href="#" class="btn btn-primary me-3">Start Exploring</a>
                                <a href="#" class="btn btn-outline">Browse Tours</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5">
                        <div class="booking-form-wrapper" data-aos="fade-left" data-aos-delay="200">
                            <div class="booking-form">
                                <h3 class="form-title">Plan Your Adventure</h3>

                                    <div class="form-group mb-3">
                                        <label for="destination">Destination</label>
                                        <select name="destination" id="destination" class="form-select" required="">
                                            <option value="">Choose your destination</option>
                                            <option value="europe">Europe</option>
                                            <option value="asia">Asia</option>
                                            <option value="america">America</option>
                                            <option value="africa">Africa</option>
                                            <option value="oceania">Oceania</option>
                                        </select>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="checkin">Departure Date</label>
                                                <input type="date" name="checkin" id="checkin" class="form-control" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="checkout">Return Date</label>
                                                <input type="date" name="checkout" id="checkout" class="form-control" required="">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group mb-3">
                                        <label for="tour-type">Tour Type</label>
                                        <select name="tour_type" id="tour-type" class="form-select" required="">
                                            <option value="">Select tour type</option>
                                            <option value="adventure">Adventure</option>
                                            <option value="cultural">Cultural</option>
                                            <option value="relaxation">Relaxation</option>
                                            <option value="family">Family</option>
                                            <option value="luxury">Luxury</option>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary w-100">Find Your Perfect Trip Now</button>
                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- /Travel Hero Section -->

        <!-- Why Us Section -->
        <section id="why-us" class="why-us section">

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <!-- About Us Content -->
                <div class="row align-items-center mb-5">
                    <div class="col-lg-6" data-aos="fade-right" data-aos-delay="200">
                        <div class="content">
                            <h3>Explore the World with Confidence</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            <div class="stats-row">
                                <div class="stat-item">
                                    <span data-purecounter-start="0" data-purecounter-end="1200" data-purecounter-duration="2" class="purecounter">0</span>
                                    <div class="stat-label">Happy Travelers</div>
                                </div>
                                <div class="stat-item">
                                    <span data-purecounter-start="0" data-purecounter-end="85" data-purecounter-duration="2" class="purecounter">0</span>
                                    <div class="stat-label">Countries Covered</div>
                                </div>
                                <div class="stat-item">
                                    <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="2" class="purecounter">0</span>
                                    <div class="stat-label">Years Experience</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6" data-aos="fade-left" data-aos-delay="300">
                        <div class="about-image">
                            <img src="assets/img/travel/showcase-8.png" alt="Travel Experience" class="img-fluid rounded-4">
                            <div class="experience-badge">
                                <div class="experience-number">15+</div>
                                <div class="experience-text">Years of Excellence</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End About Us Content -->

                <!-- Why Choose Us -->
                <div class="why-choose-section">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 text-center mb-5" data-aos="fade-up" data-aos-delay="100">
                            <h3>Why Choose Us for Your Next Adventure</h3>
                            <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</p>
                        </div>
                    </div>

                    <div class="row g-4">
                        <asp:Repeater ID="rptFeatures" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay='<%# Container.ItemIndex * 50 + 200 %>'>
                                    <div class="feature-card">
                                        <div class="feature-icon">
                                            <i class='<%# Eval("icon_class") %>'></i>
                                        </div>
                                        <h4><%# Eval("title") %></h4>
                                        <p><%# Eval("description") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <!-- End Features Grid -->
                </div>
                <!-- End Why Choose Us -->

            </div>

        </section>
        <!-- /Why Us Section -->

        <!-- Featured Destinations Section -->
        <section id="featured-destinations" class="featured-destinations section">

            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <h2>Featured Destinations</h2>
                <div><span>Check Our</span> <span class="description-title">Featured Destinations</span></div>
            </div>
            <!-- End Section Title -->

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <div class="row">

                    <div class="col-lg-6" data-aos="zoom-in" data-aos-delay="200">
                        <div class="featured-destination">
                            <div class="destination-overlay">
                                <img src="assets/img/travel/destination-3.png" alt="Tropical Paradise" class="img-fluid">
                                <div class="destination-info">
                                    <span class="destination-tag">Popular Choice</span>
                                    <h3>Tropical Paradise</h3>
                                    <p class="location"><i class="bi bi-geo-alt-fill"></i>Maldives</p>
                                    <p class="description">Pristine beaches, crystal-clear waters, and luxury overwater villas await in this tropical paradise destination.</p>
                                    <div class="destination-meta">
                                        <div class="tours-count">
                                            <i class="bi bi-collection"></i>
                                            <span>22 Packages</span>
                                        </div>
                                        <div class="rating">
                                            <i class="bi bi-star-fill"></i>
                                            <span>4.9 (412)</span>
                                        </div>
                                    </div>
                                    <div class="price-info">
                                        <span class="starting-from">Starting from</span>
                                        <span class="amount">$2,150</span>
                                    </div>
                                    <a href="destination-details.aspx" class="explore-btn">
                                        <span>Explore Now</span>
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="row g-3">

                            <div class="col-12" data-aos="fade-left" data-aos-delay="300">
                                <div class="compact-destination">
                                    <div class="destination-image">
                                        <img src="assets/img/travel/destination-7.png" alt="Mountain Adventure" class="img-fluid">
                                        <div class="badge-offer">Best Value</div>
                                    </div>
                                    <div class="destination-details">
                                        <h4>Mountain Adventure</h4>
                                        <p class="location"><i class="bi bi-geo-alt"></i>Nepal</p>
                                        <p class="brief">Breathtaking Himalayan peaks and ancient Buddhist temples create an unforgettable spiritual journey.</p>
                                        <div class="stats-row">
                                            <span class="tour-count"><i class="bi bi-calendar-check"></i>16 Tours</span>
                                            <span class="rating"><i class="bi bi-star-fill"></i>4.8</span>
                                            <span class="price">from $1,420</span>
                                        </div>
                                        <a href="destination-details.aspx" class="quick-link">View Details <i class="bi bi-chevron-right"></i></a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12" data-aos="fade-left" data-aos-delay="400">
                                <div class="compact-destination">
                                    <div class="destination-image">
                                        <img src="assets/img/travel/destination-11.png" alt="Cultural Heritage" class="img-fluid">
                                    </div>
                                    <div class="destination-details">
                                        <h4>Cultural Heritage</h4>
                                        <p class="location"><i class="bi bi-geo-alt"></i>Peru</p>
                                        <p class="brief">Discover ancient civilizations, colorful markets, and archaeological wonders in the heart of South America.</p>
                                        <div class="stats-row">
                                            <span class="tour-count"><i class="bi bi-calendar-check"></i>9 Expeditions</span>
                                            <span class="rating"><i class="bi bi-star-fill"></i>4.7</span>
                                            <span class="price">from $980</span>
                                        </div>
                                        <a href="destination-details.aspx" class="quick-link">View Details <i class="bi bi-chevron-right"></i></a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12" data-aos="fade-left" data-aos-delay="500">
                                <div class="compact-destination">
                                    <div class="destination-image">
                                        <img src="assets/img/travel/destination-16.png" alt="Safari Experience" class="img-fluid">
                                        <div class="badge-offer limited">Limited Spots</div>
                                    </div>
                                    <div class="destination-details">
                                        <h4>Safari Experience</h4>
                                        <p class="location"><i class="bi bi-geo-alt"></i>Kenya</p>
                                        <p class="brief">Witness the Big Five and experience the great migration in Africa's most spectacular wildlife reserves.</p>
                                        <div class="stats-row">
                                            <span class="tour-count"><i class="bi bi-calendar-check"></i>11 Safaris</span>
                                            <span class="rating"><i class="bi bi-star-fill"></i>4.9</span>
                                            <span class="price">from $2,750</span>
                                        </div>
                                        <a href="destination-details.aspx" class="quick-link">View Details <i class="bi bi-chevron-right"></i></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>

        </section>
        <!-- /Featured Destinations Section -->

        <!-- Featured Tours Section -->
        <section id="featured-tours" class="featured-tours section">

            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <h2>Featured Tours</h2>
                <div><span>Check Our</span> <span class="description-title">Featured Tours</span></div>
            </div>
            <!-- End Section Title -->

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <div class="row gy-4">
                    <asp:Repeater ID="rptTours" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay='<%# (Container.ItemIndex + 2) * 100 %>'>
                                <div class="tour-card">
                                    <div class="tour-image">
                                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Title") %>' class="img-fluid" loading="lazy" />
                                        <div class="tour-badge"><%# Eval("Badge") %></div>
                                        <div class="tour-price">$<%# Eval("Price") %></div>
                                    </div>
                                    <div class="tour-content">
                                        <h4><%# Eval("Title") %></h4>
                                        <div class="tour-meta">
                                            <span class="duration"><i class="bi bi-clock"></i><%# Eval("DurationDays") %> Days</span>
                                            <span class="group-size"><i class="bi bi-people"></i>Max <%# Eval("MaxGroupSize") %></span>
                                        </div>
                                        <p><%# Eval("Description") %></p>
                                        <div class="tour-highlights">
                                            <%# GetHighlightsHtml(Eval("TourHighlights")) %>
                                        </div>
                                        <div class="tour-action">
                                            <a href='/booking.aspx?Tour=<%# Eval("Id") %>' class="btn-book">Book Now</a>
                                            <div class="tour-rating">
                                                <%# GetRatingStars(Convert.ToDecimal(Eval("Rating"))) %>
                                                <span><%# Eval("Rating") %> (<%# Eval("RatingCount") %>)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>

                <div class="text-center mt-5" data-aos="fade-up" data-aos-delay="500">
                    <a href="tours.aspx" class="btn-view-all">View All Tours</a>
                </div>

            </div>

        </section>
        <!-- /Featured Tours Section -->


        <!-- Call To Action Section -->
        <section id="call-to-action" class="call-to-action section light-background">

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <div class="hero-content" data-aos="zoom-in" data-aos-delay="200">
                    <div class="content-wrapper">
                        <div class="badge-wrapper">
                            <span class="promo-badge">Limited Time Offer</span>
                        </div>
                        <h2>Discover Your Next Adventure</h2>
                        <p>Unlock incredible destinations with our specially curated travel packages. From exotic beaches to mountain peaks, your perfect getaway awaits.</p>

                        <div class="action-section">
                            <div class="main-actions">
                                <a href="destinations.aspx" class="btn btn-explore">
                                    <i class="bi bi-compass"></i>
                                    Explore Now
                                </a>
                                <a href="deals.aspx" class="btn btn-deals">
                                    <i class="bi bi-percent"></i>
                                    View Deals
                                </a>
                            </div>

                            <div class="quick-contact">
                                <span class="contact-label">Need help choosing?</span>
                                <a href="tel:+1555123456" class="contact-link">
                                    <i class="bi bi-telephone"></i>
                                    Call +1 (555) 123-456
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="visual-element">
                        <img src="assets/img/travel/showcase-3.png" alt="Travel Adventure" class="hero-image" loading="lazy">
                        <div class="image-overlay">
                            <div class="stat-item">
                                <span class="stat-number">500+</span>
                                <span class="stat-label">Destinations</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">10K+</span>
                                <span class="stat-label">Happy Travelers</span>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </section>
        <!-- /Call To Action Section -->

    </main>
</asp:Content>
