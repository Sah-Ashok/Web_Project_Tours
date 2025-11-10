<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddDestinations.aspx.cs" Inherits="Tours_Travels.AddDestinations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        /* Reusing styles from Login/Register pages for consistency */
        .form-gradient-overlay {
            background: rgba(7, 59, 58, 0.65); /* Midnight Green Overlay */
        }

        .form-card {
            background-color: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 60rem; /* Increased width for more fields */
            margin-top: 3rem;
            margin-bottom: 3rem;
        }

        .submit-btn {
            background-image: linear-gradient( to right, var(--pigment-green) 0%, var(--dartmouth-green) 100% );
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

            .submit-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            }

        .form-input-container {
            position: relative;
        }

        .form-input-icon {
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            display: flex;
            align-items: center;
            padding-left: 0.75rem;
            color: #6b7280;
            pointer-events: none;
        }

        .form-input, .form-select {
            background-color: #f3f4f6;
            border: 2px solid transparent;
            transition: all 0.3s ease;
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem; /* Adjusted padding for icon */
            border-radius: 0.5rem;
        }

        .form-textarea {
            background-color: #f3f4f6;
            border: 2px solid transparent;
            transition: all 0.3s ease;
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
        }

        .form-select { /* Custom styling for the select dropdown */
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem; /* Make space for the new arrow */
        }

            .form-input:focus, .form-select:focus, .form-textarea:focus {
                background-color: white;
                border-color: var(--dartmouth-green);
                box-shadow: 0 0 0 3px rgba(11, 110, 79, 0.2);
                outline: none;
            }

                .form-input:focus + .form-input-icon {
                    color: var(--dartmouth-green);
                }

        .form-file-input {
            background-color: #f3f4f6;
            border: 2px solid transparent;
            border-radius: 0.5rem;
            padding: 0.5rem;
            transition: all 0.3s ease;
            width: 100%;
        }

            .form-file-input:hover {
                border-color: var(--dartmouth-green);
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <section class="relative min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
            <!-- Background Image and Overlay -->
            <div class="absolute inset-0 h-full w-full">
                <div
                    class="absolute inset-0 parallax-bg"
                    style="background-image: url('https://images.unsplash.com/photo-1517999349371-c43520457b23?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'); background-position: center;">
                </div>
                <div class="absolute inset-0 form-gradient-overlay"></div>
            </div>

            <!-- Add Destination Form Card -->
            <div class="relative w-full p-8 sm:p-10 space-y-8 rounded-2xl shadow-2xl form-card" data-aos="fade-up">
                <div class="text-center">
                    <h2 class="text-3xl sm:text-4xl font-bold heading-font" style="color: var(--midnight-green)">Add New Destination
                    </h2>
                    <p class="mt-2 text-md text-text-light font-light">
                        Fill in the details to add a new travel package to the collection.
                    </p>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-center block font-semibold"></asp:Label>

                <div class="mt-8 space-y-6">
                    <div class="rounded-md shadow-sm space-y-4">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <asp:TextBox ID="txtDestName" runat="server" CssClass="form-input" placeholder="Destination Name (e.g., Paris, France)" required></asp:TextBox>
                                <i class="bi bi-pin-map-fill form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <asp:TextBox ID="txtTagline" runat="server" CssClass="form-input" placeholder="Tagline (e.g., City of Love)" required></asp:TextBox>
                                <i class="bi bi-card-text form-input-icon"></i>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-input" placeholder="Duration (e.g., 7 Days / 6 Nights)" required></asp:TextBox>
                                <i class="bi bi-clock form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <asp:TextBox ID="txtGroupSize" runat="server" CssClass="form-input" placeholder="Group Size (e.g., Up to 12 people)" required></asp:TextBox>
                                <i class="bi bi-people form-input-icon"></i>
                            </div>
                        </div>
                        <div class="form-input-container">
                            <asp:TextBox ID="txtRegion" runat="server" CssClass="form-input" placeholder="Region (e.g., Europe)" required></asp:TextBox>
                            <i class="bi bi-globe-americas form-input-icon"></i>
                        </div>

                        <div>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="4" placeholder="Enter a brief description of the destination..." required></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="txtIncluded" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="4" placeholder="What's Included? (Enter one item per line)" required></asp:TextBox>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input" placeholder="Price (e.g., 1200)" TextMode="Number" required></asp:TextBox>
                                <i class="bi bi-currency-rupee form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Select Category" Value="" />
                                    <asp:ListItem Text="Adventure" Value="adventure" />
                                    <asp:ListItem Text="Cultural" Value="cultural" />
                                    <asp:ListItem Text="Beach" Value="beach" />
                                    <asp:ListItem Text="City Break" Value="city" />
                                </asp:DropDownList>
                                <i class="bi bi-tags-fill form-input-icon"></i>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 items-center">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Main Image</label>
                                <asp:FileUpload ID="fileMainImage" runat="server" CssClass="form-file-input" />
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Gallery Images</label>
                                <asp:FileUpload ID="fileGalleryImages" runat="server" CssClass="form-file-input" AllowMultiple="true" />
                            </div>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="btnAddDestination" runat="server" Text="Add Destination" OnClick="btnAddDestination_Click" CssClass="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-semibold rounded-lg text-white submit-btn focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-pigment-green mt-4" />
                    </div>
                </div>
            </div>
        </section>
    </form>
</asp:Content>
