<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Tours_Travels.ViewDetails" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Tab Styles */
        .tab-button {
            transition: all 0.3s ease;
            border-bottom: 3px solid transparent;
            padding-bottom: 8px;
            cursor: pointer;
        }

            .tab-button.active {
                color: var(--dartmouth-green);
                border-bottom-color: var(--dartmouth-green);
            }

        .tab-content {
            display: none;
        }

            .tab-content.active {
                display: block;
                animation: fadeIn 0.5s ease-in-out;
            }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* --- START: UPDATED WISHLIST BUTTON STYLES --- */
        .wishlist-btn:hover {
            background-color: var(--dartmouth-green);
            color: white;
        }

        .wishlist-btn.active {
            background-color: var(--dartmouth-green);
            color: white;
            border-color: var(--dartmouth-green);
        }

            .wishlist-btn.active:hover {
                background-color: var(--midnight-green);
            }
        /* --- END: UPDATED WISHLIST BUTTON STYLES --- */

        /* Gallery Lightbox */
        #lightbox {
            display: none;
            position: fixed;
            z-index: 1000;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9);
            justify-content: center;
            align-items: center;
        }

            #lightbox img {
                max-width: 85%;
                max-height: 80%;
                border-radius: 8px;
            }

        .lightbox-nav {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            color: white;
            font-size: 50px;
            cursor: pointer;
            background-color: rgba(0, 0, 0, 0.3);
            padding: 10px;
            border-radius: 50%;
            user-select: none;
        }

        #prev-btn {
            left: 20px;
        }

        #next-btn {
            right: 20px;
        }

        .close-lightbox {
            position: absolute;
            top: 20px;
            right: 30px;
            color: white;
            font-size: 40px;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Destination Details -->
        <div id="divDetails" runat="server" visible="false">
            <main>
                <section id="heroSection" runat="server" class="relative pt-24 h-[60vh] text-white bg-cover bg-center">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent"></div>
                    <div class="relative h-full flex flex-col justify-end container mx-auto px-4 pb-12">
                        <div data-aos="fade-up">
                            <h1 class="text-4xl md:text-6xl font-bold heading-font mb-2">
                                <asp:Literal ID="litDestName" runat="server"></asp:Literal>
                            </h1>
                            <p class="text-xl md:text-2xl mb-6 text-slate-200">
                                <asp:Literal ID="litTagline" runat="server"></asp:Literal>
                            </p>
                            <div class="flex flex-wrap gap-x-8 gap-y-4 text-lg">
                                <div class="flex items-center gap-2">
                                    <i class="las la-clock text-ecru"></i><span>
                                        <asp:Literal ID="litDuration" runat="server"></asp:Literal></span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <i class="las la-user-friends text-ecru"></i><span>
                                        <asp:Literal ID="litGroupSize" runat="server"></asp:Literal></span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <i class="las la-map-marker text-ecru"></i><span>
                                        <asp:Literal ID="litRegion" runat="server"></asp:Literal></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Overview / Included / Gallery Tabs -->
                <section class="py-16 md:py-24">
                    <div class="container mx-auto px-4">
                        <div class="grid grid-cols-1 lg:grid-cols-3 gap-12">
                            <div class="lg:col-span-2">
                                <div class="border-b border-gray-200 mb-8" data-aos="fade-up">
                                    <nav class="flex flex-wrap -mb-px space-x-8">
                                        <div class="tab-button active py-4 px-1 text-lg font-semibold" data-tab="overview">Overview</div>
                                        <div class="tab-button py-4 px-1 text-lg font-semibold" data-tab="included">What's Included</div>
                                        <div class="tab-button py-4 px-1 text-lg font-semibold" data-tab="gallery">Gallery</div>
                                    </nav>
                                </div>

                                <div id="overview" class="tab-content active" data-aos-delay="100">
                                    <h2 class="text-3xl heading-font font-bold mb-4 text-midnight-green">
                                        <asp:Literal ID="litOverviewTitle" runat="server"></asp:Literal></h2>
                                    <div class="text-text-light text-lg leading-relaxed space-y-4">
                                        <asp:Literal ID="litOverviewText" runat="server"></asp:Literal>
                                    </div>
                                </div>

                                <div id="included" class="tab-content">
                                    <ul class="space-y-4">
                                        <asp:Repeater ID="rptInclusions" runat="server">
                                            <ItemTemplate>
                                                <li class="flex items-center text-lg">
                                                    <i class="las la-check-circle text-2xl mr-3 text-pigment-green"></i>
                                                    <span><%# Eval("InclusionText") %></span>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>

                                <div id="gallery" class="tab-content">
                                    <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
                                        <asp:Repeater ID="rptGallery" runat="server">
                                            <ItemTemplate>
                                                <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("AltText") %>" class="rounded-lg cursor-pointer hover:opacity-80 transition-opacity gallery-image" data-aos="zoom-in" />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Panel -->
                            <div class="lg:col-span-1" data-aos="fade-left">
                                <div class="bg-white rounded-lg shadow-lg p-8 sticky top-28">
                                    <div class="flex justify-between items-baseline mb-6">
                                        <div>
                                            <p class="text-lg text-text-light">From</p>
                                            <p class="text-5xl font-bold heading-font text-midnight-green">
                                                <asp:Literal ID="litPrice" runat="server"></asp:Literal>
                                            </p>
                                        </div>
                                        <p class="text-lg font-normal text-text-light">per-person</p>
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanelWishlist" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="flex flex-col gap-4">
                                                <asp:HyperLink ID="hlBookNow" runat="server" Text="Book Now"
                                                    CssClass="w-full text-center py-4 rounded-full text-white text-xl font-bold transition-transform hover:scale-105"
                                                    Style="background-color: var(--dartmouth-green)">
                                                </asp:HyperLink>

                                             
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div class="mt-6 text-center">
                                        <a href="Contact.aspx" class="text-dartmouth-green font-semibold hover:underline">Contact Us for Customizations</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>

        </div>

        <!-- Error Section -->
        <div id="divError" runat="server" visible="false" class="text-center py-24">
            <h2 class="text-3xl font-bold text-red-600">Destination Not Found</h2>
            <p class="text-text-light mt-4 text-lg">The trip you are looking for does not exist or has been removed.</p>
            <a href="Destination.aspx" class="inline-block mt-6 px-8 py-3 rounded-full font-semibold text-white" style="background-color: var(--dartmouth-green);">View All Destinations</a>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <div id="lightbox">
        <span class="close-lightbox">&times;</span>
        <div id="prev-btn" class="lightbox-nav"><i class="las la-angle-left"></i></div>
        <img id="lightbox-img" src="" alt="Enlarged gallery image" />
        <div id="next-btn" class="lightbox-nav"><i class="las la-angle-right"></i></div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            initializePage();
        });

        function pageLoad() {
            initializePage();
        }

        function initializePage() {
            AOS.init({ duration: 800, once: true, offset: 50 });

            const tabButtons = document.querySelectorAll(".tab-button");
            const tabContents = document.querySelectorAll(".tab-content");
            tabButtons.forEach((button) => {
                button.addEventListener("click", () => {
                    const tabId = button.dataset.tab;
                    tabButtons.forEach((btn) => btn.classList.remove("active"));
                    button.classList.add("active");
                    tabContents.forEach((content) => {
                        content.classList.remove("active");
                        if (content.id === tabId) {
                            content.classList.add("active");
                        }
                    });
                });
            });

            const lightbox = document.getElementById("lightbox");
            if (lightbox) {
                const lightboxImg = document.getElementById("lightbox-img");
                const galleryImages = Array.from(document.querySelectorAll(".gallery-image"));
                const closeBtn = document.querySelector(".close-lightbox");
                const prevBtn = document.getElementById("prev-btn");
                const nextBtn = document.getElementById("next-btn");
                let currentIndex = 0;

                const showImage = (index) => {
                    if (galleryImages.length > 0) {
                        lightboxImg.src = galleryImages[index].src;
                        currentIndex = index;
                    }
                };

                galleryImages.forEach((img, index) => {
                    img.addEventListener("click", () => {
                        lightbox.style.display = "flex";
                        showImage(index);
                    });
                });

                if (closeBtn) {
                    closeBtn.addEventListener("click", () => { lightbox.style.display = "none"; });
                }

                lightbox.addEventListener("click", (e) => {
                    if (e.target === lightbox) lightbox.style.display = "none";
                });

                if (prevBtn) {
                    prevBtn.addEventListener("click", () => {
                        const newIndex = (currentIndex - 1 + galleryImages.length) % galleryImages.length;
                        showImage(newIndex);
                    });
                }

                if (nextBtn) {
                    nextBtn.addEventListener("click", () => {
                        const newIndex = (currentIndex + 1) % galleryImages.length;
                        showImage(newIndex);
                    });
                }
            }
        }
    </script>
</asp:Content>
