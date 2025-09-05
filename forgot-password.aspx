<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="Web_Project_Tours.forgot_password" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="main" style="min-height: 80vh; display: flex; align-items: center; justify-content: center; background: #f5f7fa;">
        <section id="forgot-password" class="forgot-password-section section w-100">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-7 col-sm-10">
                        <!-- Card Panel -->
                        <asp:Panel ID="pnlCard" runat="server" CssClass="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-5">
                                <h3 class="form-title text-center mb-3 fw-bold" style="color: #333;">Forgot Password</h3>
                                <p class="text-center text-muted mb-4">Enter your email address to receive a password reset link.</p>

                                <!-- Message Label -->
                                <asp:Label ID="lblMessage" runat="server" CssClass="text-center mb-3 d-block" ForeColor="Red"></asp:Label>

                                <!-- Email Input -->
                                <div class="mb-4">
                                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="form-label fw-semibold">Email Address</asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" Placeholder="Enter your email"></asp:TextBox>
                                </div>

                                <!-- Send Button -->
                                <div class="d-grid mb-3">
                                    <asp:Button ID="btnSendLink" runat="server" Text="Send Reset Link" CssClass="btn btn-primary btn-lg rounded-3 shadow-sm" OnClick="btnSendLink_Click" />
                                </div>

                                <!-- Links -->
                                <div class="text-center">
                                    <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="login.aspx" CssClass="text-decoration-none text-primary d-block mb-1">Remembered your password? Log in</asp:HyperLink>
                                    <asp:HyperLink ID="lnkSignup" runat="server" NavigateUrl="sign-up.aspx" CssClass="text-decoration-none text-secondary d-block">Don't have an account? Sign up</asp:HyperLink>
                                </div>
                            </div>
                        </asp:Panel>

                        <!-- Optional illustration image -->
                        <div class="text-center mt-4">
                            <asp:Image ID="imgIllustration" runat="server" ImageUrl="~/assets/img/forgot-password-illustration.png" CssClass="img-fluid" AlternateText="Forgot Password Illustration" Style="max-height: 150px;" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
