﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Web_Project_Tours.gallery" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background" data-aos="fade" style="background-image: url(assets/img/travel/showcase-8.webp);">
      <div class="container position-relative">
        <h1>Gallery</h1>
        <p>Esse dolorum voluptatum ullam est sint nemo et est ipsa porro placeat quibusdam quia assumenda numquam molestias.</p>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.aspx">Home</a></li>
            <li class="current">Gallery</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Gallery Slider Section -->
    <section id="gallery-slider" class="gallery-slider section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="gallery-container">
          <div class="swiper init-swiper">
            <script type="application/json" class="swiper-config">
              {
                "loop": true,
                "speed": 800,
                "autoplay": {
                  "delay": 4000
                },
                "effect": "coverflow",
                "grabCursor": true,
                "centeredSlides": true,
                "slidesPerView": "auto",
                "coverflowEffect": {
                  "rotate": 50,
                  "stretch": 0,
                  "depth": 100,
                  "modifier": 1,
                  "slideShadows": true
                },
                "pagination": {
                  "el": ".swiper-pagination",
                  "type": "bullets",
                  "clickable": true
                },
                "navigation": {
                  "nextEl": ".swiper-button-next",
                  "prevEl": ".swiper-button-prev"
                },
                "breakpoints": {
                  "320": {
                    "slidesPerView": 1,
                    "spaceBetween": 10
                  },
                  "768": {
                    "slidesPerView": 2,
                    "spaceBetween": 20
                  },
                  "1024": {
                    "slidesPerView": 3,
                    "spaceBetween": 30
                  }
                }
              }
            </script>
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-3.webp">
                      <img src="assets/img/gallery/gallery-3.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-1.webp">
                      <img src="aE:\C# practice\Web_Project_Tours\assets\img\gallery\gallery-1.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-5.webp">
                      <img src="assets/img/gallery/gallery-5.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-7.webp">
                      <img src="assets/img/gallery/gallery-7.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-2.webp">
                      <img src="assets/img/gallery/gallery-2.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-4.webp">
                      <img src="assets/img/gallery/gallery-4.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-6.webp">
                      <img src="assets/img/gallery/gallery-6.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="gallery-item">
                  <div class="gallery-img">
                    <a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-8.webp">
                      <img src="assets/img/gallery/gallery-8.webp" class="img-fluid" alt="">
                      <div class="gallery-overlay">
                        <i class="bi bi-plus-circle"></i>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
          </div>
        </div>

      </div>

    </section><!-- /Gallery Slider Section -->

    <!-- Gallery Section -->
    <section id="gallery" class="gallery section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">
          <ul class="gallery-filters isotope-filters" data-aos="fade-up" data-aos-delay="200">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-nature">Nature</li>
            <li data-filter=".filter-architecture">Architecture</li>
            <li data-filter=".filter-people">People</li>
          </ul>

          <div class="row gallery-grid isotope-container" data-aos="fade-up" data-aos-delay="300">

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-nature">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-1.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Natural Beauty</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-1.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-architecture">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-2.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Urban Landscape</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-2.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-people">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-3.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Candid Moments</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-3.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-nature">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-4.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Wilderness</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-4.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-architecture">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-5.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Modern Design</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-5.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-people">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-6.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Portrait Studies</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-6.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-nature">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-7.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Serene Waters</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-7.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-architecture">
              <div class="gallery-card">
                <div class="gallery-image">
                  <img src="assets/img/gallery/gallery-8.webp" class="img-fluid" alt="">
                </div>
                <div class="gallery-overlay">
                  <h4>Historical Places</h4>
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                  <div class="gallery-actions">
                    <a href="assets/img/gallery/gallery-8.webp" title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                    <a href="gallery-details.aspx"><i class="bi bi-info-circle"></i></a>
                  </div>
                </div>
              </div>
            </div><!-- End Gallery Item -->

          </div>
        </div>

      </div>

    </section><!-- /Gallery Section -->

  </main>

</asp:Content>

