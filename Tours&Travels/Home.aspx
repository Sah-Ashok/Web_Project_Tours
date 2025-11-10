<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Tours_Travels.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>

      /* Updated container max-width constraint for 90% desktop width */
      .container {
        max-width: 90%;
        margin: 0 auto;
      }

      @media (max-width: 768px) {
        .container {
          max-width: 95%;
        }
      }

      /* Enhanced hero section with new color overlay */
      .hero-gradient {
        background: rgba(7, 59, 58, 0.6); /* Midnight Green Overlay */
      }

      /* Enhanced card hover effects */
      .card-hover {
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        position: relative;
        overflow: hidden;
        background-color: #ffffff;
        border: 1px solid #e5e7eb;
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1),
          0 2px 4px -2px rgb(0 0 0 / 0.1);
      }

      .card-hover:hover {
        transform: translateY(-10px) scale(1.02);
        box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1),
          0 8px 10px -6px rgb(0 0 0 / 0.1);
        border-color: var(--ecru);
      }

     

      /* Added floating animation for icons */
      .floating-icon {
        animation: float 3s ease-in-out infinite;
      }

      @keyframes float {
        0%,
        100% {
          transform: translateY(0px);
        }
        50% {
          transform: translateY(-10px);
        }
      }

      /* Enhanced parallax effect */
      .parallax-bg {
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
      }

      .parallax-bg::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(7, 59, 58, 0.4);
      }

      /* Added pulse animation for CTA buttons */
      .pulse-btn {
        animation: pulse 2s infinite;
        background-image: linear-gradient(
          to right,
          var(--pigment-green) 0%,
          var(--dartmouth-green) 100%
        );
      }

      @keyframes pulse {
        0% {
          box-shadow: 0 0 0 0 rgba(8, 160, 69, 0.7);
        }
        70% {
          box-shadow: 0 0 0 10px rgba(8, 160, 69, 0);
        }
        100% {
          box-shadow: 0 0 0 0 rgba(8, 160, 69, 0);
        }
      }

      /* Enhanced section spacing and typography */
      .section-padding {
        padding: 5rem 0;
      }

      @media (max-width: 768px) {
        .section-padding {
          padding: 3rem 0;
        }
      }

      /* Added gradient text effect using new color scheme */
      .gradient-text {
        background: linear-gradient(
          135deg,
          var(--dartmouth-green),
          var(--pigment-green)
        );
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
      }

      /* Added special styling for famous destinations section */
      .famous-destinations {
        background: linear-gradient(135deg, var(--ivory-bg), #ffffff);
        border-top: 3px solid var(--mantis);
        border-bottom: 3px solid var(--mantis);
      }

      .destination-badge {
        background: var(--dartmouth-green);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 2rem;
        font-size: 0.875rem;
        font-weight: 600;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
      }



  
      .why-us-card {
        transition: all 0.3s ease-in-out;
        padding: 1.5rem;
        border-radius: 0.75rem;
        background-color: white;
        border: 1px solid #e5e7eb;
      }
      .why-us-card .icon-bg {
        transition: all 0.3s ease-in-out;
      }
      .why-us-card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      }
      .why-us-card:hover .icon-bg {
        background-color: var(--ecru) !important;
      }
      .why-us-card:hover .icon-bg i {
        color: var(--midnight-green) !important;
      }

      .hero-title {
        text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
      }

      .section-separator {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        overflow: hidden;
        line-height: 0;
        transform: rotate(180deg);
      }

      .section-separator svg {
        position: relative;
        display: block;
        width: calc(100% + 1.3px);
        height: 80px;
      }

      .section-separator .shape-fill {
        fill: var(--ivory-bg);
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section
      id="home"
      class="relative h-screen flex items-center justify-center overflow-hidden"
    >
      <div
        class="absolute inset-0 parallax-bg"
        style="
          background-image: url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
        "
      ></div>
      <div class="absolute inset-0 hero-gradient"></div>

      <div
        class="hero-content relative z-10 text-center text-white px-4 sm:px-6 max-w-5xl container"
      >
        <h1
          class="hero-title text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-bold mb-6 leading-tight heading-font"
          data-aos="fade-up"
        >
          Discover Your Next
          <span class="block mt-2" style="color: var(--ecru)">Adventure</span>
        </h1>
        <p
          class="hero-subtitle text-lg sm:text-xl md:text-2xl mb-8 opacity-90 max-w-3xl mx-auto font-light"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          Explore breathtaking destinations, create unforgettable memories, and
          embark on the journey of a lifetime with our expertly crafted tours
        </p>
        <div
          class="flex flex-col sm:flex-row gap-4 justify-center items-center"
          data-aos="fade-up"
          data-aos-delay="400"
        >
          <button
            class="w-full sm:w-auto px-8 py-4 text-lg font-semibold rounded-full transition-all transform hover:scale-105 pulse-btn"
            style="color: white"
          >
            <i class="las la-compass mr-2"></i>
            Explore Trips
          </button>
        </div>
      </div>

      <div
        class="absolute bottom-8 left-1/2 transform -translate-x-1/2 text-white animate-bounce"
      >
        <i class="las la-chevron-down text-3xl"></i>
      </div>

      <div class="section-separator">
        <svg
          data-name="Layer 1"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 1200 120"
          preserveAspectRatio="none"
        >
          <path
            d="M1200 120L0 16.48 0 0 1200 0 1200 120z"
            class="shape-fill"
          ></path>
        </svg>
      </div>
    </section>

    <main>
      <!-- New Popular Destinations Section -->
      <section
        id="destinations"
        class="section-padding"
        style="background-color: var(--ivory-bg)"
      >
        <div class="container px-4 sm:px-6">
          <div class="text-center mb-16" data-aos="fade-up">
            <h2
              class="text-4xl sm:text-5xl md:text-6xl font-bold mb-6 heading-font"
              style="color: var(--midnight-green)"
            >
              Explore Our Curated Destinations
            </h2>
            <p class="text-xl text-text-light max-w-3xl mx-auto font-light">
              Handpicked journeys to the world's most captivating corners,
              waiting for you to discover.
            </p>
          </div>

          <div
            class="grid grid-cols-1 lg:grid-cols-3 gap-8 h-auto lg:h-[600px]"
          >
            <div
              class="lg:col-span-2 rounded-lg overflow-hidden card-hover group relative"
              data-aos="zoom-in-right"
              data-aos-easing="ease-in-out-sine"
            >
              <img
                src="https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
                alt="Machu Picchu"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent"
              ></div>
              <div class="absolute bottom-0 left-0 p-8 text-white">
                <h3 class="text-4xl font-bold mb-2 heading-font">
                  Machu Picchu, Peru
                </h3>
                <p class="text-lg opacity-90 mb-4 max-w-lg">
                  Discover the lost city of the Incas, a breathtaking wonder of
                  the ancient world nestled high in the Andes.
                </p>
                <button
                  class="px-6 py-3 rounded-full font-semibold transition-all hover:scale-105 text-white"
                  style="background-color: var(--dartmouth-green)"
                >
                  <i class="las la-arrow-right mr-2"></i>Explore Peru
                </button>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-1 gap-8">
              <div
                class="rounded-lg overflow-hidden card-hover group relative"
                data-aos="zoom-in-left"
                data-aos-easing="ease-in-out-sine"
                data-aos-delay="100"
              >
                <img
                  src="https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                  alt="Kyoto, Japan"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent"
                ></div>
                <div class="absolute bottom-0 left-0 p-6 text-white">
                  <h3 class="text-2xl font-bold heading-font">Kyoto, Japan</h3>
                  <p class="opacity-90">Ancient temples & serene gardens.</p>
                </div>
              </div>
              <div
                class="rounded-lg overflow-hidden card-hover group relative"
                data-aos="zoom-in-left"
                data-aos-easing="ease-in-out-sine"
                data-aos-delay="200"
              >
                <img
                  src="./amplifi.jpg"
                  alt="Amalfi Coast, Italy"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent"
                ></div>
                <div class="absolute bottom-0 left-0 p-6 text-white">
                  <h3 class="text-2xl font-bold heading-font">
                    Amalfi Coast, Italy
                  </h3>
                  <p class="opacity-90">
                    Cliffside villages & turquoise waters.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section id="tour-experience" class="section-padding bg-white">
        <div class="container px-4 sm:px-6">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div class="order-2 lg:order-1" data-aos="fade-right">
              <h2
                class="text-4xl sm:text-5xl font-bold mb-6 heading-font gradient-text"
              >
                Crafting Your Perfect Journey
              </h2>
              <p
                class="text-xl mb-6 font-light"
                style="color: var(--text-light)"
              >
                Travel is more than seeing new places; it’s about experiencing
                them. Our tours are designed to immerse you in the local
                culture, connect you with nature, and create memories that last
                a lifetime.
              </p>
              <ul class="space-y-4 mb-8 text-lg font-light">
                <li class="flex items-center">
                  <i
                    class="las la-check-circle text-2xl mr-3"
                    style="color: var(--dartmouth-green)"
                  ></i>
                  <span
                    ><strong class="font-semibold">Expert Local Guides:</strong>
                    Discover hidden gems known only to locals.</span
                  >
                </li>
                <li class="flex items-center">
                  <i
                    class="las la-check-circle text-2xl mr-3"
                    style="color: var(--dartmouth-green)"
                  ></i>
                  <span
                    ><strong class="font-semibold"
                      >Authentic Experiences:</strong
                    >
                    From cooking classes to cultural workshops.</span
                  >
                </li>
                <li class="flex items-center">
                  <i
                    class="las la-check-circle text-2xl mr-3"
                    style="color: var(--dartmouth-green)"
                  ></i>
                  <span
                    ><strong class="font-semibold"
                      >Seamless & Stress-Free:</strong
                    >
                    We handle all the details, so you can just enjoy.</span
                  >
                </li>
              </ul>
              <button
                class="px-8 py-4 text-lg font-semibold rounded-full transition-all transform hover:scale-105"
                style="background-color: var(--pigment-green); color: white"
              >
                <i class="las la-info-circle mr-2"></i>
                Learn About Our Process
              </button>
            </div>
            <div class="order-1 lg:order-2" data-aos="fade-left">
              <div class="rounded-lg overflow-hidden shadow-2xl card-hover">
                <img
                  src="https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
                  alt="A serene travel destination"
                  class="w-full h-full object-cover"
                />
              </div>
            </div>
          </div>
        </div>
      </section>

      <section
        id="famous-destinations"
        class="section-padding famous-destinations"
      >
        <div class="container px-4 sm:px-6">
          <div class="text-center mb-16" data-aos="fade-up">
            <div class="destination-badge mx-auto mb-6">
              <i class="las la-star"></i>
              World Famous Destinations
            </div>
            <h2
              class="text-4xl sm:text-5xl md:text-6xl font-bold mb-6 heading-font"
              style="color: var(--midnight-green)"
            >
              Iconic Places You Must Visit
            </h2>
            <p
              class="text-xl max-w-3xl mx-auto font-light"
              style="color: var(--text-light)"
            >
              Experience the world's most legendary destinations with our
              exclusive access and expert local guides.
            </p>
          </div>

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-12">
            <div
              class="relative rounded-lg overflow-hidden card-hover group"
              data-aos="zoom-in-up"
            >
              <div class="relative h-96">
                <img
                  src="./148.jpg"
                  alt="Santorini Greece"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-70"
                ></div>
                <div class="absolute bottom-6 left-6 right-6 text-white">
                  <div class="flex items-center mb-3">
                    <div class="destination-badge">
                      <i class="las la-crown"></i>
                      UNESCO Heritage
                    </div>
                  </div>
                  <h3 class="text-3xl font-bold mb-2 heading-font">
                    Santorini, Greece
                  </h3>
                  <p class="text-lg opacity-90 mb-4">
                    Witness the world's most spectacular sunsets from clifftop
                    villages.
                  </p>
                  <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                      <div class="flex items-center">
                        <i
                          class="las la-star mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span class="font-semibold">4.9</span>
                      </div>
                      <div class="flex items-center">
                        <i
                          class="las la-users mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span>2.1k+ travelers</span>
                      </div>
                    </div>
                    <button
                      class="px-6 py-5 rounded-full font-semibold transition-all hover:scale-105"
                      style="
                        background-color: var(--dartmouth-green);
                        color: white;
                      "
                    >
                      Explore 
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <div
              class="relative rounded-lg overflow-hidden card-hover group"
              data-aos="zoom-in-up"
              data-aos-delay="100"
            >
              <div class="relative h-96">
                <img
                  src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
                  alt="Bora Bora"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-70"
                ></div>
                <div class="absolute bottom-6 left-6 right-6 text-white">
                  <div class="flex items-center mb-3">
                    <div class="destination-badge">
                      <i class="las la-gem"></i>
                      Luxury Paradise
                    </div>
                  </div>
                  <h3 class="text-3xl font-bold mb-2 heading-font">
                    Bora Bora, French Polynesia
                  </h3>
                  <p class="text-lg opacity-90 mb-4">
                    Ultimate luxury in overwater bungalows surrounded by
                    turquoise lagoons.
                  </p>
                  <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                      <div class="flex items-center">
                        <i
                          class="las la-star mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span class="font-semibold">4.8</span>
                      </div>
                      <div class="flex items-center">
                        <i
                          class="las la-users mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span>1.8k+ travelers</span>
                      </div>
                    </div>
                    <button
                      class="px-6 py-3 rounded-full font-semibold transition-all hover:scale-105"
                      style="
                        background-color: var(--dartmouth-green);
                        color: white;
                      "
                    >
                      Explore Now
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section id="about" class="py-16 sm:py-20 bg-ivory-bg">
        <div class="container mx-auto px-4 sm:px-6">
          <div class="text-center mb-12 sm:mb-16" data-aos="fade-up">
            <h2
              class="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 gradient-text heading-font"
            >
              Why Choose Wanderlust Tours?
            </h2>
            <p
              class="text-lg sm:text-xl text-text-light max-w-2xl mx-auto px-4 font-light"
            >
              We're committed to making your travel dreams come true with
              exceptional service and unforgettable experiences.
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div
              class="text-center why-us-card"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <div
                class="w-16 h-16 sm:w-20 sm:h-20 rounded-full mx-auto mb-6 flex items-center justify-center icon-bg"
                style="background-color: var(--midnight-green)"
              >
                <i
                  class="bi bi-shield-check text-2xl sm:text-3xl text-white"
                ></i>
              </div>
              <h3
                class="text-xl sm:text-2xl font-bold mb-4 heading-font"
                style="color: var(--midnight-green)"
              >
                Trusted & Safe
              </h3>
              <p class="text-text-light text-sm sm:text-base font-light">
                Your safety is our priority. We partner with certified operators
                and maintain the highest safety standards.
              </p>
            </div>

            <div
              class="text-center why-us-card"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <div
                class="w-16 h-16 sm:w-20 sm:h-20 rounded-full mx-auto mb-6 flex items-center justify-center icon-bg"
                style="background-color: var(--dartmouth-green)"
              >
                <i class="bi bi-headset text-2xl sm:text-3xl text-white"></i>
              </div>
              <h3
                class="text-xl sm:text-2xl font-bold mb-4 heading-font"
                style="color: var(--midnight-green)"
              >
                24/7 Support
              </h3>
              <p class="text-text-light text-sm sm:text-base font-light">
                Our dedicated team is available around the clock to assist you
                before, during, and after your trip.
              </p>
            </div>

            <div
              class="text-center why-us-card"
              data-aos="fade-up"
              data-aos-delay="300"
            >
              <div
                class="w-16 h-16 sm:w-20 sm:h-20 rounded-full mx-auto mb-6 flex items-center justify-center icon-bg"
                style="background-color: var(--pigment-green)"
              >
                <i class="bi bi-award text-2xl sm:text-3xl text-white"></i>
              </div>
              <h3
                class="text-xl sm:text-2xl font-bold mb-4 heading-font"
                style="color: var(--midnight-green)"
              >
                Award Winning
              </h3>
              <p class="text-text-light text-sm sm:text-base font-light">
                Recognized as the leading travel company with multiple industry
                awards for excellence and customer satisfaction.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section
        class="py-16 sm:py-20"
        style="background-color: rgba(221, 183, 113, 0.2)"
      >
        <div class="container mx-auto px-4 sm:px-6">
          <div class="text-center mb-12 sm:mb-16" data-aos="fade-up">
            <h2
              class="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 gradient-text heading-font"
            >
              What Our Travelers Say
            </h2>
            <p
              class="text-lg sm:text-xl text-text-light max-w-2xl mx-auto px-4 font-light"
            >
              Real stories from real travelers who've experienced the magic of
              our tours.
            </p>
          </div>

          <div
            class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8"
          >
            <div
              class="bg-white rounded-lg p-6 sm:p-8 shadow-lg relative"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <i
                class="bi bi-quote text-7xl absolute top-4 left-4"
                style="color: rgba(11, 110, 79, 0.1)"
              ></i>
              <div class="relative z-10">
                <div class="flex items-center mb-6">
                  <img
                    src="https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80"
                    alt="Sarah Johnson"
                    class="w-12 h-12 rounded-full mr-4 object-cover"
                  />
                  <div>
                    <h4
                      class="font-bold text-sm sm:text-base"
                      style="color: var(--midnight-green)"
                    >
                      Sarah Johnson
                    </h4>
                    <p class="text-text-light text-xs sm:text-sm">
                      Adventure Enthusiast
                    </p>
                  </div>
                </div>
                <div class="flex mb-4" style="color: var(--ecru)">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i>
                </div>
                <p class="text-text-light text-sm sm:text-base font-light">
                  The Swiss Alps tour was absolutely incredible! Every detail
                  was perfectly planned, and the guides were knowledgeable and
                  friendly.
                </p>
              </div>
            </div>

            <div
              class="bg-white rounded-lg p-6 sm:p-8 shadow-lg relative"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <i
                class="bi bi-quote text-7xl absolute top-4 left-4"
                style="color: rgba(11, 110, 79, 0.1)"
              ></i>
              <div class="relative z-10">
                <div class="flex items-center mb-6">
                  <img
                    src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80"
                    alt="Michael Chen"
                    class="w-12 h-12 rounded-full mr-4 object-cover"
                  />
                  <div>
                    <h4
                      class="font-bold text-sm sm:text-base"
                      style="color: var(--midnight-green)"
                    >
                      Michael Chen
                    </h4>
                    <p class="text-text-light text-xs sm:text-sm">
                      Cultural Explorer
                    </p>
                  </div>
                </div>
                <div class="flex mb-4" style="color: var(--ecru)">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i>
                </div>
                <p class="text-text-light text-sm sm:text-base font-light">
                  Japan exceeded all my expectations! The cultural immersion was
                  authentic, and I learned so much about the local traditions.
                </p>
              </div>
            </div>

            <div
              class="bg-white rounded-lg p-6 sm:p-8 shadow-lg relative"
              data-aos="fade-up"
              data-aos-delay="300"
            >
              <i
                class="bi bi-quote text-7xl absolute top-4 left-4"
                style="color: rgba(11, 110, 79, 0.1)"
              ></i>
              <div class="relative z-10">
                <div class="flex items-center mb-6">
                  <img
                    src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80"
                    alt="Emma Wilson"
                    class="w-12 h-12 rounded-full mr-4 object-cover"
                  />
                  <div>
                    <h4
                      class="font-bold text-sm sm:text-base"
                      style="color: var(--midnight-green)"
                    >
                      Emma & David
                    </h4>
                    <p class="text-text-light text-xs sm:text-sm">
                      Honeymooners
                    </p>
                  </div>
                </div>
                <div class="flex mb-4" style="color: var(--ecru)">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i>
                </div>
                <p class="text-text-light text-sm sm:text-base font-light">
                  Our Maldives honeymoon was pure paradise! The overwater villa
                  was stunning, and the service was impeccable. Thank you!
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Newsletter Section - UPDATED -->
      <section class="section-padding bg-ivory-bg">
        <div class="container mx-auto px-4 sm:px-6">
          <div
            class="bg-white rounded-lg shadow-xl overflow-hidden"
            data-aos="fade-up"
          >
            <div class="p-8 lg:p-12 text-center">
              <div class="max-w-2xl mx-auto">
                <h2
                  class="text-3xl sm:text-4xl font-bold mb-4 text-midnight-green heading-font"
                >
                  Join Our Newsletter
                </h2>
                <p class="text-lg text-text-light mb-8 font-light">
                  Subscribe to get our latest travel deals, tips, and
                  destination inspiration delivered right to your inbox.
                </p>
                <div class="flex flex-col sm:flex-row gap-4 max-w-lg mx-auto">
                  <input
                    type="email"
                    placeholder="Enter your email"
                    class="flex-1 px-4 sm:px-6 py-3 rounded-full text-gray-800 border-2 border-gray-200 focus:outline-none focus:ring-2 focus:ring-dartmouth-green text-sm sm:text-base"
                  />
                  <button
                    class="px-6 sm:px-8 py-3 rounded-full font-semibold transition-all hover:transform hover:scale-105 text-sm sm:text-base"
                    style="
                      background-color: var(--dartmouth-green);
                      color: white;
                    "
                  >
                    Subscribe
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
</asp:Content>

