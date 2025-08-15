<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Web_Project_Tours.gallery" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background" data-aos="fade" style='background-image: url(assets/img/travel/showcase-8.png);'>
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
    </div>

    <!-- Gallery Slider Section -->
    <section id="gallery-slider" class="gallery-slider section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="gallery-container">
                <div class="swiper init-swiper">
                    <!-- Swiper Config JSON -->
                    <script type="application/json" class="swiper-config">
                        {
                            "loop": true,
                            "speed": 800,
                            "autoplay": { "delay": 4000 },
                            "effect": "coverflow",
                            "grabCursor": true,
                            "centeredSlides": true,
                            "slidesPerView": "auto",
                            "coverflowEffect": { "rotate": 50, "stretch": 0, "depth": 100, "modifier": 1, "slideShadows": true },
                            "pagination": { "el": ".swiper-pagination", "type": "bullets", "clickable": true },
                            "navigation": { "nextEl": ".swiper-button-next", "prevEl": ".swiper-button-prev" },
                            "breakpoints": { "320": { "slidesPerView": 1, "spaceBetween": 10 }, "768": { "slidesPerView": 2, "spaceBetween": 20 }, "1024": { "slidesPerView": 3, "spaceBetween": 30 } }
                        }
                    </script>

                    <div class="swiper-wrapper">
                        <asp:Repeater ID="rptSlider" runat="server">
                            <ItemTemplate>
                                <div class="swiper-slide">
                                    <div class="gallery-item">
                                        <div class="gallery-img">
                                            <a class="glightbox" data-gallery="images-gallery" href='<%# Eval("ImagePath") %>'>
                                                <img src='<%# Eval("ImagePath") %>' class="img-fluid" alt="">
                                                <div class="gallery-overlay">
                                                    <i class="bi bi-plus-circle"></i>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
        </div>
    </section>

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
                    <asp:Repeater ID="rptGallery" runat="server">
                        <ItemTemplate>
                            <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item <%# Eval("CategoryClass") %>">
                                <div class="gallery-card">
                                    <div class="gallery-image">
                                        <img src='<%# Eval("ImagePath") %>' class="img-fluid" alt="">
                                    </div>
                                    <div class="gallery-overlay">
                                        <h4><%# Eval("Title") %></h4>
                                        <p><%# Eval("Description") %></p>
                                        <div class="gallery-actions">
                                            <a href='<%# Eval("ImagePath") %>' title="View Image" class="glightbox"><i class="bi bi-eye"></i></a>
                                            <a href="gallery-details.aspx?ImageId=<%# Eval("ImageId") %>"><i class="bi bi-info-circle"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>
        </div>
    </section>
</main>
</asp:Content>
