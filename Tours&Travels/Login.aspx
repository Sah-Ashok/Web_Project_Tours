<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Tours_Travels.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   
        .login-gradient-overlay {
            background: rgba(7, 59, 58, 0.65); 
        }

        .login-card {
            background-color: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .login-btn {
            background-image: linear-gradient( to right, var(--pigment-green) 0%, var(--dartmouth-green) 100% );
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
                <div
                    class="absolute inset-0 parallax-bg"
                    style="background-image: url('https://images.unsplash.com/photo-1519922639102-1436259e0b9a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'); background-position: center;">
                </div>
                <div class="absolute inset-0 login-gradient-overlay"></div>
            </div>

            <!-- Login Form Card -->
            <div class="relative w-full max-w-md p-8 sm:p-10 space-y-8 rounded-2xl shadow-2xl login-card" data-aos="fade-up">
                <div class="text-center">
                    <h2 class="text-3xl sm:text-4xl font-bold heading-font" style="color: var(--midnight-green)">Welcome Back!
                    </h2>
                    <p class="mt-2 text-md text-text-light font-light">
                        Sign in to continue your adventure.
                    </p>
                </div>

                <div class="mt-8 space-y-6">
                    <!-- Message Label -->
                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="block text-center text-sm font-semibold mb-2"
                        ForeColor="Red">
                    </asp:Label>
                    <div class="rounded-md shadow-sm -space-y-px">
                        <div class="mb-4">
                            <asp:Label ID="lblEmail" runat="server" For="txtEmail" CssClass="sr-only">Email address</asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" autocomplete="email" 
                                CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                placeholder="Email address" />
                        </div>
                        <div>
                            <asp:Label ID="lblPassword" runat="server" For="txtPassword" CssClass="sr-only">Password</asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="current-password" 
                                CssClass="appearance-none rounded-lg relative block w-full px-4 py-3 placeholder-gray-500 text-gray-900 focus:outline-none focus:z-10 text-sm sm:text-base form-input"
                                placeholder="Password" />
                        </div>
                    </div>

                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <asp:CheckBox ID="chkRememberMe" runat="server"
                                CssClass="h-4 w-4 rounded border-gray-300" Style="color: var(--dartmouth-green);" />
                            <asp:Label ID="lblRememberMe" runat="server" for="chkRememberMe" CssClass="ml-2 block text-sm text-gray-900">
                            Remember me
                            </asp:Label>
                        </div>

                        <div class="text-sm">
                            <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="ForgetPassword.aspx"
                                CssClass="font-medium hover:underline" Style="color: var(--dartmouth-green);">
                            Forgot your password?
                            </asp:HyperLink>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="btnLogin" runat="server" Text="Sign in"
                            CssClass="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-semibold rounded-lg text-white login-btn focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-pigment-green" OnClick="btnLogin_Click1" />
                    </div>

                    <div class="text-center">
                        <p class="text-sm text-gray-600">
                            Don't have an account?
                        <asp:HyperLink ID="hlSignUp" runat="server" NavigateUrl="Register.aspx"
                            CssClass="font-bold hover:underline" Style="color: var(--dartmouth-green);">
                            Sign Up
                        </asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </form>
</asp:Content>
