<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddDest.aspx.cs" Inherits="Tours_Travels.AddDest" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        .form-gradient-overlay {
            background: rgba(7, 59, 58, 0.65);
        }
        .form-card {
            background-color: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 60rem;
            margin-top: 3rem;
            margin-bottom: 3rem;
        }
        .submit-btn {
            background-image: linear-gradient(to right, var(--pigment-green) 0%, var(--dartmouth-green) 100%);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            display: inline-block;
            border: 1px solid transparent;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border-radius: 0.5rem;
            width: 100%;
            cursor: pointer;
            color: white;
        }
        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1),
                         0 4px 6px -4px rgb(0 0 0 / 0.1);
        }
        .form-input-container { position: relative; }
        .form-input-icon {
            position: absolute;
            left: 0; top: 0; bottom: 0;
            display: flex; align-items: center;
            padding-left: 0.75rem; color: #6b7280;
            pointer-events: none;
        }
        .form-input, .form-select {
            background-color: #f3f4f6;
            border: 2px solid transparent;
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border-radius: 0.5rem;
        }
        .form-textarea {
            background-color: #f3f4f6;
            border: 2px solid transparent;
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
        }
        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem;
        }
        .form-input:focus, .form-select:focus, .form-textarea:focus {
            background-color: white;
            border-color: var(--dartmouth-green);
            box-shadow: 0 0 0 3px rgba(11, 110, 79, 0.2);
            outline: none;
        }
        .form-file-input {
            background-color: #f3f4f6;
            border: 2px solid transparent;
            border-radius: 0.5rem;
            padding: 0.5rem;
            width: 100%;
        }

        .status-box {
            position: fixed;
            top: 100px;
            left: 20px;
            width: 250px;
            padding: 10px;
            border-radius: 8px;
            color: white;
            z-index: 1000;
        }
        .status-success { background-color: green; }
        .status-error { background-color: red; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="addDestinationForm" runat="server" enctype="multipart/form-data">

        <section class="relative min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">

            <div class="absolute inset-0 h-full w-full">
                <div class="absolute inset-0 parallax-bg"
                     style="background-image: url('https://images.unsplash.com/photo-1517999349371-c43520457b23?auto=format&fit=crop&w=1920&q=80'); background-position: center;">
                </div>
                <div class="absolute inset-0 form-gradient-overlay"></div>
            </div>

            <div class="relative w-full p-8 sm:p-10 space-y-8 rounded-2xl shadow-2xl form-card">
                
                <div class="text-center">
                    <h2 class="text-3xl sm:text-4xl font-bold" style="color: var(--midnight-green)">Add New Destination</h2>
                    <p class="mt-2 text-md text-text-light">Fill in the details to add a new package.</p>
                </div>

                <asp:Literal ID="StatusLiteral" runat="server"></asp:Literal>

                <div class="mt-8 space-y-6">

                    <div class="rounded-md shadow-sm space-y-4">

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <input type="text" name="DestName" class="form-input" placeholder="Destination Name" required />
                                <i class="bi bi-pin-map-fill form-input-icon"></i>
                            </div>

                            <div class="form-input-container">
                                <input type="text" name="Tagline" class="form-input" placeholder="Tagline" required />
                                <i class="bi bi-card-text form-input-icon"></i>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <input type="text" name="Duration" class="form-input" placeholder="Duration" required />
                                <i class="bi bi-clock form-input-icon"></i>
                            </div>

                            <div class="form-input-container">
                                <input type="text" name="GroupSize" class="form-input" placeholder="Group Size" required />
                                <i class="bi bi-people form-input-icon"></i>
                            </div>
                        </div>

                        <div class="form-input-container">
                            <input type="text" name="Region" class="form-input" placeholder="Region" required />
                            <i class="bi bi-globe-americas form-input-icon"></i>
                        </div>

                        <textarea name="Description" class="form-textarea" rows="4" placeholder="Description..." required></textarea>
                        <textarea name="Included" class="form-textarea" rows="4" placeholder="Included..." required></textarea>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <input type="number" name="Price" class="form-input" placeholder="Price" required />
                                <i class="bi bi-currency-rupee form-input-icon"></i>
                            </div>

                            <div class="form-input-container">
                                <select name="Category" class="form-select" required>
                                    <option value="">Select Category</option>
                                    <option value="adventure">Adventure</option>
                                    <option value="cultural">Cultural</option>
                                    <option value="beach">Beach</option>
                                    <option value="city">City Break</option>
                                </select>
                                <i class="bi bi-tags-fill form-input-icon"></i>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <label>Main Image</label>
                                <asp:FileUpload ID="MainImageUpload" runat="server" CssClass="form-file-input" />
                            </div>

                            <div>
                                <label>Gallery Images</label>
                                <asp:FileUpload ID="GalleryImagesUpload" runat="server" AllowMultiple="true" CssClass="form-file-input" />
                            </div>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="SubmitBtn" runat="server" Text="Add Destination"
                            OnClick="SubmitBtn_Click_Async"
                            CssClass="submit-btn" />
                    </div>

                </div>

            </div>

        </section>

    </form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>