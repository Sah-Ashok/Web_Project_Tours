<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Tours_Travels.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Using styles consistent with Login.aspx for a cohesive look */
        .login-gradient-overlay {
            background: rgba(7, 59, 58, 0.65); /* Midnight Green Overlay */
        }

        .login-card {
            background-color: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .login-btn {
            background-image: linear-gradient(to right, var(--pigment-green) 0%, var(--dartmouth-green) 100%);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
        }

        .form-input {
            background-color: #f3f4f6;
            border: 2px solid transparent;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            background-color: white;
            border-color: var(--dartmouth-green);
            box-shadow: 0 0 0 3px rgba(11, 110, 79, 0.2);
            outline: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <section class="relative min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
            <!-- Background Image and Overlay -->
            <div class="absolute inset-0 h-full w-full">
                <div class="absolute inset-0 parallax-bg"
                    style="background-image: url('https://images.unsplash.com/photo-1504632349213-a420042d2a1a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'); background-position: center;">
                </div>
                <div class="absolute inset-0 login-gradient-overlay"></div>
            </div>

            <!-- Registration Form Card -->
            <div class="relative w-full p-8 sm:p-10 space-y-8 rounded-2xl shadow-2xl login-card" style="max-width: 50rem; margin-top: 3rem;" data-aos="fade-up">
                <div class="text-center">
                    <h2 class="text-3xl sm:text-4xl font-bold heading-font" style="color: var(--midnight-green)">Join the Adventure</h2>
                    <p class="mt-2 text-md text-text-light font-light">
                        Create an account to start your journey.
                    </p>
                </div>

                <div class="mt-8 space-y-6">
                    <!-- Message Label -->
                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="block text-center text-sm font-semibold mb-2"
                        ForeColor="Red">
                    </asp:Label>

                    <div class="rounded-md shadow-sm">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                            <div>
                                <asp:Label ID="lblFirstName" runat="server" For="txtFirstName" CssClass="sr-only">First Name</asp:Label>
                                <asp:TextBox ID="txtFirstName" runat="server" autocomplete="given-name" required
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="First Name" />
                            </div>
                            <div>
                                <asp:Label ID="lblLastName" runat="server" For="txtLastName" CssClass="sr-only">Last Name</asp:Label>
                                <asp:TextBox ID="txtLastName" runat="server" autocomplete="family-name" required
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="Last Name" />
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                            <div>
                                <asp:Label ID="lblEmail" runat="server" For="txtEmail" CssClass="sr-only">Email address</asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" autocomplete="email" required
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="Email address" />
                            </div>
                            <div>
                                <asp:Label ID="lblPhone" runat="server" For="txtPhone" CssClass="sr-only">Phone</asp:Label>
                                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" autocomplete="tel" required
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="Phone Number" />
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                            <div>
                                <asp:Label ID="lblCountry" runat="server" For="ddlCountry" CssClass="sr-only">Country</asp:Label>
                                <asp:DropDownList ID="ddlCountry" runat="server" autocomplete="country-name"
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input">
                                    <asp:ListItem Value="" Disabled="True" Selected="True">Select your country</asp:ListItem>
                                    <asp:ListItem Value="IN">India</asp:ListItem>
                                    <asp:ListItem Value="US">United States</asp:ListItem>
                                    <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                    <asp:ListItem Value="CA">Canada</asp:ListItem>
                                    <asp:ListItem Value="AU">Australia</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div>
                                <asp:Label ID="lblState" runat="server" For="txtState" CssClass="sr-only">State</asp:Label>
                                <asp:TextBox ID="txtState" runat="server" autocomplete="address-level1" 
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="State" />
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                            <div>
                                <asp:Label ID="lblCity" runat="server" For="txtCity" CssClass="sr-only">City</asp:Label>
                                <asp:TextBox ID="txtCity" runat="server" autocomplete="address-level2" 
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="City" />
                            </div>
                            <div>
                                <asp:Label ID="lblFileUpload" runat="server" For="fpImage" CssClass="sr-only">Profile Picture</asp:Label>
                                <asp:FileUpload ID="fpImage" runat="server"
                                    CssClass="block w-full text-sm text-slate-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-violet-50 file:text-violet-700 hover:file:bg-violet-100" />
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <asp:Label ID="lblPassword" runat="server" For="txtPassword" CssClass="sr-only">Password</asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="new-password" 
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="Password" />
                            </div>
                            <div>
                                <asp:Label ID="lblConfirmPassword" runat="server" For="txtConfirmPassword" CssClass="sr-only">Confirm Password</asp:Label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" autocomplete="new-password" 
                                    CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                    placeholder="Confirm Password" />
                            </div>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account"
                            CssClass="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-semibold rounded-lg text-white login-btn focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-pigment-green mt-4"
                            OnClick="btnCreateAccount_Click" />
                    </div>

                    <div class="text-center">
                        <p class="text-sm text-gray-600">
                            Already have an account?
                            <asp:HyperLink ID="hlSignIn" runat="server" NavigateUrl="~/Login.aspx"
                                CssClass="font-bold hover:underline" Style="color: var(--dartmouth-green);">
                                Sign In
                            </asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </form>
</asp:Content>
