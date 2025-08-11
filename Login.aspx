<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Project_Tours.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .main {
            padding-top: 80px;
        }
        .login-section {
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-form-wrapper {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        .login-form .form-title {
            font-family: 'Raleway', sans-serif;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }
    </style>

    <main class="main">
        <section id="login" class="login-section section">
            <div class="container" data-aos="fade-up" data-aos-delay="100">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-8">
                        <div class="login-form-wrapper">
                            <div class="login-form">
                                <h3 class="form-title text-center">Log In</h3>
                                <p class="text-center mb-4">Welcome back! Please log in to continue your journey.</p>

                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                                <div class="mb-3">
                                    <label for="txtEmail">Email Address</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                                 TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <label for="txtPassword">Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                                 TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                                </div>

                                <div class="form-check mb-3">
                                    <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input" />
                                    <label class="form-check-label" for="chkRemember">Remember me</label>
                                </div>

                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" 
                                            Text="Log In" OnClick="btnLogin_Click" />

                                <div class="text-center mt-4">
                                    <p>Don't have an account? <a href="sign-up.aspx">Sign up</a></p>
                                    <p><a href="forgot-password.aspx">Forgot your password?</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
