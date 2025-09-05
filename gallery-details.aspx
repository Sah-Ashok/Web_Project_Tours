<%@ Page Title="Gallery Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gallery-details.aspx.cs" Inherits="Web_Project_Tours.gallery_details" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background" data-aos="fade" 
         style="background-image: url(assets/img/travel/showcase-8.webp);">
      <div class="container position-relative">
        <h1>Gallery Details</h1>
        <p>Explore the details of this captivating image from our gallery.</p>
        <nav class="breadcrumbs">
          <ol>
            <li>
              <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/index.aspx">Home</asp:HyperLink>
            </li>
            <li>
              <asp:HyperLink ID="lnkGallery" runat="server" NavigateUrl="~/gallery.aspx">Gallery</asp:HyperLink>
            </li>
            <li class="current">Gallery Details</li>
          </ol>
        </nav>
      </div>
    </div>
    <!-- End Page Title -->

    <!-- Gallery Details Section -->
    <section id="gallery-details" class="gallery-details section">
      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <div class="row gy-4">
          <div class="col-lg-8">
            <div class="gallery-image">
              <asp:Image ID="imgMain" runat="server" CssClass="img-fluid" 
                         ImageUrl="~/assets/img/gallery/gallery-1.webp" AlternateText="Natural Beauty" />
              <div class="gallery-actions mt-3">
                <asp:HyperLink ID="lnkViewFull" runat="server" 
                               CssClass="glightbox btn btn-primary" 
                               NavigateUrl="~/assets/img/gallery/gallery-1.webp">
                  <i class="bi bi-eye"></i> View Full Image
                </asp:HyperLink>
                <asp:HyperLink ID="lnkBack" runat="server" 
                               CssClass="btn btn-outline-secondary" 
                               NavigateUrl="~/gallery.aspx">
                  <i class="bi bi-arrow-left"></i> Back to Gallery
                </asp:HyperLink>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="gallery-info">
              <h3>
                <asp:Label ID="lblTitle" runat="server" Text="Natural Beauty"></asp:Label>
              </h3>
              <ul>
                <li><strong>Category:</strong> <asp:Label ID="lblCategory" runat="server" Text="Nature"></asp:Label></li>
                <li><strong>Location:</strong> <asp:Label ID="lblLocation" runat="server" Text="Unknown Wilderness"></asp:Label></li>
                <li><strong>Date:</strong> <asp:Label ID="lblDate" runat="server" Text="August 10, 2025"></asp:Label></li>
                <li><strong>Photographer:</strong> <asp:Label ID="lblPhotographer" runat="server" Text="John Doe"></asp:Label></li>
              </ul>
              <p>
                <asp:Label ID="lblDescription1" runat="server" 
                           Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."></asp:Label>
              </p>
              <p>
                <asp:Label ID="lblDescription2" runat="server" 
                           Text="This image captures the serene beauty of untouched nature, showcasing vibrant colors and tranquil scenery."></asp:Label>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /Gallery Details Section -->

<!-- Related Images Section -->
<section id="related-images" class="gallery section">
  <div class="container" data-aos="fade-up" data-aos-delay="100">
    <h2 class="section-title">Related Images</h2>
    <div class="row gallery-grid isotope-container" data-aos="fade-up" data-aos-delay="300">
      
      <asp:Repeater ID="rptRelatedImages" runat="server">
        <ItemTemplate>
          <div class="col-xl-3 col-md-4 col-sm-6 gallery-item isotope-item filter-<%# Eval("Category") %>">
            <div class="gallery-card">
              <div class="gallery-image">
                <asp:Image ID="imgRelated" runat="server" CssClass="img-fluid" 
                           ImageUrl='<%# Eval("ImagePath") %>' AlternateText='<%# Eval("Title") %>' />
              </div>
              <div class="gallery-overlay">
                <h4><%# Eval("Title") %></h4>
                <p><%# Eval("Description") %></p>
                <div class="gallery-actions">
                  <asp:HyperLink ID="lnkViewImage" runat="server" 
                                 NavigateUrl='<%# Eval("ImagePath") %>' 
                                 CssClass="glightbox">
                    <i class="bi bi-eye"></i>
                  </asp:HyperLink>
                  <asp:HyperLink ID="lnkDetails" runat="server" 
                                 NavigateUrl='<%# "gallery-details.aspx?ImageId=" + Eval("ImageId") %>'>
                    <i class="bi bi-info-circle"></i>
                  </asp:HyperLink>
                </div>
              </div>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>

    </div>
  </div>
</section>


  </main>
</asp:Content>
