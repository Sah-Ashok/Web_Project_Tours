<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Tours_Travels.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
    .hero-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(7, 59, 58, 0.6); /* Midnight Green Overlay */
        z-index: 1;
    }

    .hero-content {
        position: relative;
        z-index: 2;
    }

    .team-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .team-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
    }
    .team-card-img-wrapper {
        position: relative;
        overflow: hidden;
    }
    .team-card-img-wrapper img {
        transition: transform 0.4s ease;
    }
    .team-card:hover .team-card-img-wrapper img {
        transform: scale(1.05);
    }
    .team-social-links {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        display: flex;
        justify-content: center;
        gap: 1rem;
        padding: 1rem;
        background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
        transform: translateY(100%);
        transition: transform 0.4s ease;
    }
    .team-card:hover .team-social-links {
        transform: translateY(0);
    }
    .team-social-links a {
        color: white;
        opacity: 0.8;
        transition: opacity 0.3s ease, transform 0.3s ease;
    }
    .team-social-links a:hover {
        opacity: 1;
        transform: scale(1.2);
    }
    
    .value-card {
        border: 1px solid #e5e7eb;
        transition: all 0.3s ease-in-out;
    }
    .value-card:hover {
        border-color: var(--dartmouth-green);
        transform: translateY(-5px);
    }
    .value-icon {
        background-color: var(--dartmouth-green);
        color: white;
        transition: all 0.3s ease-in-out;
    }
    .value-card:hover .value-icon {
        background-color: var(--ecru);
        color: var(--midnight-green);
        transform: rotate(-15deg) scale(1.1);
    }
    
    .cta-section {
        background-image: linear-gradient(135deg, var(--pigment-green) 0%, var(--dartmouth-green) 100%);
    }

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <main>
        <!-- Hero Section -->
        <section class="hero-section relative h-80 md:h-96 w-full bg-cover bg-center flex items-center justify-center text-white" data-aos="fade-in" style="background-image: url('https://images.unsplash.com/photo-1523908511403-7fc7b25592f4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
            <div class="hero-content text-center container mx-auto px-4" data-aos="fade-up">
                <h1 class="text-4xl md:text-6xl font-bold heading-font mb-4">About Wanderlust Tours</h1>
                <p class="text-lg md:text-xl max-w-3xl mx-auto">Crafting unforgettable journeys with passion and expertise.</p>
            </div>
        </section>

        <!-- Our Story Section -->
        <section class="py-16 md:py-24 bg-white">
            <div class="container mx-auto px-4">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                    <div data-aos="fade-right">
                        <img src="https://images.unsplash.com/photo-1522199755839-a2bacb67c546?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="Travel planning session" class="rounded-lg shadow-xl w-full h-auto">
                    </div>
                    <div data-aos="fade-left" data-aos-delay="200">
                        <h2 class="text-4xl font-bold heading-font text-midnight-green mb-6">Our Story</h2>
                        <p class="text-lg text-text-light mb-4 leading-relaxed">
                            Wanderlust Tours was born from a simple yet profound love for exploration. Founded in 2015, our journey began with a small team of passionate travelers who believed that travel should be more than just visiting a place; it should be an experience that transforms you.
                        </p>
                        <p class="text-lg text-text-light leading-relaxed">
                            We started with a mission to create authentic, immersive, and sustainable travel experiences that connect travelers with the heart and soul of a destination. Today, we've grown into a leading travel company, but our core philosophy remains the same: to share the magic of travel and create memories that last a lifetime.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Our Values Section -->
        <section class="py-16 md:py-24 bg-gray-50">
            <div class="container mx-auto px-4">
                <div class="text-center mb-12" data-aos="fade-up">
                    <h2 class="text-4xl font-bold heading-font text-midnight-green">Our Core Values</h2>
                    <p class="mt-4 text-lg text-text-light max-w-2xl mx-auto">The principles that guide every journey we craft.</p>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <!-- Value Card 1 -->
                    <div class="p-8 text-center bg-white rounded-lg value-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="inline-flex items-center justify-center w-20 h-20 mb-6 rounded-full value-icon">
                           <i class="bi bi-compass text-4xl"></i>
                        </div>
                        <h3 class="text-2xl font-bold heading-font mb-3 text-midnight-green">Passion for Adventure</h3>
                        <p class="text-text-light">We are explorers at heart, driven to uncover the world's wonders and share them with you.</p>
                    </div>
                     <!-- Value Card 2 -->
                    <div class="p-8 text-center bg-white rounded-lg value-card" data-aos="fade-up" data-aos-delay="200">
                        <div class="inline-flex items-center justify-center w-20 h-20 mb-6 rounded-full value-icon">
                           <i class="bi bi-shield-check text-4xl"></i>
                        </div>
                        <h3 class="text-2xl font-bold heading-font mb-3 text-midnight-green">Commitment to Quality</h3>
                        <p class="text-text-light">From expert guides to premium accommodations, we ensure excellence in every detail of your trip.</p>
                    </div>
                     <!-- Value Card 3 -->
                    <div class="p-8 text-center bg-white rounded-lg value-card" data-aos="fade-up" data-aos-delay="300">
                        <div class="inline-flex items-center justify-center w-20 h-20 mb-6 rounded-full value-icon">
                           <i class="bi bi-tree text-4xl"></i>
                        </div>
                        <h3 class="text-2xl font-bold heading-font mb-3 text-midnight-green">Sustainable Travel</h3>
                        <p class="text-text-light">We are dedicated to responsible tourism that respects local cultures and protects the environment.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Meet The Team Section -->
        <section class="py-16 md:py-24 bg-white">
            <div class="container mx-auto px-4">
                 <div class="text-center mb-12" data-aos="fade-up">
                    <h2 class="text-4xl font-bold heading-font text-midnight-green">Meet Our Expert Team</h2>
                    <p class="mt-4 text-lg text-text-light max-w-2xl mx-auto">The passionate professionals behind your perfect vacation.</p>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                    <!-- Team Member 1 -->
                    <div class="text-center bg-gray-50 rounded-lg overflow-hidden team-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="team-card-img-wrapper h-80">
                            <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Team Member 1" class="w-full h-full object-cover object-center">
                             <div class="team-social-links">
                                <a href="#"><i class="bi bi-linkedin text-2xl"></i></a>
                                <a href="#"><i class="bi bi-twitter text-2xl"></i></a>
                            </div>
                        </div>
                        <div class="p-6">
                            <h3 class="text-2xl font-bold heading-font text-midnight-green">Alex Thompson</h3>
                            <p class="text-md text-dartmouth-green font-semibold">Founder & CEO</p>
                        </div>
                    </div>
                    <!-- Team Member 2 -->
                     <div class="text-center bg-gray-50 rounded-lg overflow-hidden team-card" data-aos="fade-up" data-aos-delay="200">
                        <div class="team-card-img-wrapper h-80">
                            <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Team Member 2" class="w-full h-full object-cover object-center">
                             <div class="team-social-links">
                                <a href="#"><i class="bi bi-linkedin text-2xl"></i></a>
                                <a href="#"><i class="bi bi-instagram text-2xl"></i></a>
                            </div>
                        </div>
                        <div class="p-6">
                            <h3 class="text-2xl font-bold heading-font text-midnight-green">Maria Garcia</h3>
                            <p class="text-md text-dartmouth-green font-semibold">Head of Destinations</p>
                        </div>
                    </div>
                    <!-- Team Member 3 -->
                     <div class="text-center bg-gray-50 rounded-lg overflow-hidden team-card" data-aos="fade-up" data-aos-delay="300">
                        <div class="team-card-img-wrapper h-80">
                            <img src="https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Team Member 3" class="w-full h-full object-cover object-center">
                             <div class="team-social-links">
                                <a href="#"><i class="bi bi-linkedin text-2xl"></i></a>
                                <a href="#"><i class="bi bi-envelope-fill text-2xl"></i></a>
                            </div>
                        </div>
                        <div class="p-6">
                            <h3 class="text-2xl font-bold heading-font text-midnight-green">David Chen</h3>
                            <p class="text-md text-dartmouth-green font-semibold">Lead Travel Specialist</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="py-20 cta-section text-white">
            <div class="container mx-auto px-4 text-center" data-aos="fade-up">
                <h2 class="text-4xl font-bold heading-font mb-4">Ready for Your Next Adventure?</h2>
                <p class="text-xl mb-8 max-w-2xl mx-auto">Browse our curated collection of destinations and start planning the trip of a lifetime.</p>
                <a href="Destinations.aspx" class="inline-block px-10 py-4 text-lg font-semibold rounded-full transition-transform hover:scale-105" style="background-color: var(--ecru); color: var(--midnight-green);">
                    Explore Destinations
                </a>
            </div>
        </section>
    </main>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        // AOS initialization is handled globally in Site1.Master, so no specific script is needed here unless for custom functionality.
    </script>
</asp:Content>

