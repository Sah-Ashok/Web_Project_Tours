<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Tours_Travels.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        .form-container {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.8);
        }

        .form-input-wrapper {
            position: relative;
        }

            .form-input-wrapper .form-icon {
                position: absolute;
                left: 1rem;
                top: 50%;
                transform: translateY(-50%);
                color: #9ca3af; /* text-gray-400 */
                font-size: 1.25rem;
            }

        .form-input {
            padding-left: 3rem; /* Space for the icon */
            width: 100%;
            border: 1px solid #d1d5db;
            border-radius: 9999px;
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
            transition: all 0.3s ease;
        }

            .form-input:focus {
                border-color: var(--dartmouth-green);
                outline: none;
                box-shadow: 0 0 0 3px rgba(11, 110, 79, 0.2);
            }

        .submit-btn {
            background-color: var(--dartmouth-green);
            transition: all 0.3s ease;
        }

            .submit-btn:hover {
                background-color: var(--midnight-green);
                transform: scale(1.05);
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <main>
            <section class="relative min-h-screen flex items-center justify-center py-12 px-4 bg-cover bg-center" style="background-image: url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
                <div class="absolute inset-0" style="background-color: rgba(11, 110, 79, 0.9);"></div>

                <div class="relative w-full max-w-md" data-aos="fade-up">
                    <div class="form-container border border-gray-200 rounded-2xl shadow-xl p-8 md:p-10">
                        <div class="text-center mb-8">
                            <h1 class="text-3xl md:text-4xl font-bold heading-font text-midnight-green">Reset Your Password</h1>
                            <p class="text-text-light mt-3">Enter your email to receive an OTP, then enter the OTP to reset your password.</p>
                            <!-- Message Label -->
                            <asp:Label ID="lblMessage" runat="server"
                                CssClass="block text-center text-sm font-semibold mb-2"
                                ForeColor="Red">
                            </asp:Label>
                        </div>

                        <div class="space-y-6">
                            <!-- Email Input -->
                            <div class="form-input-wrapper">
                                <i class="bi bi-envelope-fill form-icon"></i>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" Placeholder="Enter your email address" TextMode="Email"></asp:TextBox>
                            </div>

                            <!-- OTP Input (Initially hidden) -->
                            <div class="form-input-wrapper" runat="server" id="otpWrapper" visible="false">
                                <i class="bi bi-shield-lock-fill form-icon"></i>
                                <asp:TextBox ID="txtOTP" runat="server" CssClass="form-input" Placeholder="Enter OTP"></asp:TextBox>
                            </div>

                            <!-- Submit Button -->
                            <div>
                                <asp:Button ID="btnVerifyReset" runat="server" Text="Verify Email"
                                    CssClass="w-full py-3 px-4 rounded-full text-white font-semibold text-lg submit-btn"
                                    OnClick="btnVerifyReset_Click" />
                            </div>
                        </div>

                        <div class="text-center mt-6">
                            <a href="Login.aspx" class="font-semibold text-dartmouth-green hover:underline">
                                <i class="bi bi-arrow-left-circle mr-1"></i>Back to Login
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </form>
</asp:Content>
