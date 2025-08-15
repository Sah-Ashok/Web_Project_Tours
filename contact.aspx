<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Web_Project_Tours.contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="main">

        <!-- Page Title -->
        <div class="page-title dark-background" data-aos="fade" style="background-image: url(assets/img/travel/showcase-8.png);">
            <div class="container position-relative">
                <h1>Contact</h1>
                <p>Esse dolorum voluptatum ullam est sint nemo et est ipsa porro placeat quibusdam quia assumenda numquam molestias.</p>
                <nav class="breadcrumbs">
                    <ol>
                        <li><a href="index.aspx">Home</a></li>
                        <li class="current">Contact</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- End Page Title -->

        <!-- Contact Section -->
        <section id="contact" class="contact section">

            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <!-- Contact Info Boxes -->
                <div class="row gy-4 mb-5">
                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="contact-info-box">
                            <div class="icon-box">
                                <i class="bi bi-geo-alt"></i>
                            </div>
                            <div class="info-content">
                                <h4>Our Address</h4>
                                <p>1842 Maple Avenue, Portland, Oregon 97204</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="contact-info-box">
                            <div class="icon-box">
                                <i class="bi bi-envelope"></i>
                            </div>
                            <div class="info-content">
                                <h4>Email Address</h4>
                                <p>info@example.com</p>
                                <p>contact@example.com</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
                        <div class="contact-info-box">
                            <div class="icon-box">
                                <i class="bi bi-headset"></i>
                            </div>
                            <div class="info-content">
                                <h4>Hours of Operation</h4>
                                <p>Sunday-Fri: 9 AM - 6 PM</p>
                                <p>Saturday: 9 AM - 4 PM</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Google Maps -->
            <div class="map-section" data-aos="fade-up" data-aos-delay="200">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d11138.681699441273!2d70.89868808041973!3d22.24107378204767!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2sin!4v1754993487109!5m2!1sen!2sin" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
            </div>

            <!-- Contact Form -->
            <div class="container form-container-overlap">
                <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="300">
                    <div class="col-lg-10">
                        <div class="contact-form-wrapper">
                            <h2 class="text-center mb-4">Get in Touch</h2>
                            <asp:Panel ID="pnlContactForm" runat="server" CssClass="row g-3">

                                <!-- Name -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-person"></i>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Email -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-envelope"></i>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Subject -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-text-left"></i>
                                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" Placeholder="Subject"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Message -->
                                <div class="col-12">
                                    <div class="form-group">
                                        <div class="input-with-icon">
                                            <i class="bi bi-chat-dots message-icon"></i>
                                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" Placeholder="Write Message..." TextMode="MultiLine" Rows="6"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <!-- Status Messages -->
                                <div class="col-12">
                                    <asp:Literal ID="litStatus" runat="server" EnableViewState="false" />
                                </div>

                                <!-- Submit Button -->
                                <div class="col-12 text-center">
                                    <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary btn-submit" Text="SEND MESSAGE" OnClick="btnSend_Click" />
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!-- End Contact Section -->

    </main>
</asp:Content>
