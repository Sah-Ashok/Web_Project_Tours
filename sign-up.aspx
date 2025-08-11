<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="sign-up.aspx.cs" Inherits="Web_Project_Tours.sign_up" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .main {
            padding-top: 80px;
        }
        .signup-section {
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .signup-form-wrapper {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }
        .signup-form .form-title {
            font-family: 'Raleway', sans-serif;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }
    </style>

    <main class="main">
        <section id="signup" class="signup-section section">
            <div class="container" data-aos="fade-up" data-aos-delay="100">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-8">
                        <div class="signup-form-wrapper">
                            <div class="signup-form">
                                <h3 class="form-title text-center">Create Your Account</h3>
                                <p class="text-center mb-4">
                                    Join Tour to unlock exclusive deals and personalized travel experiences.
                                </p>

                                <!-- ASP.NET form content (no <form> tag here) -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="FullName">Full Name</label>
                                        <asp:TextBox ID="FullName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="Phone">Phone Number</label>
                                        <asp:TextBox ID="Phone" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="Email">Email Address</label>
                                        <asp:TextBox ID="Email" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="Countries">Country</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                                            <asp:DropDownList ID="Countries" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="Select your country" Value=""></asp:ListItem>
                                                <asp:ListItem Text="Australia" Value="australia"></asp:ListItem>
                                                <asp:ListItem Text="India" Value="india"></asp:ListItem>
                                                <asp:ListItem Text="Nepal" Value="nepal"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="Password">Password</label>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create a password"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ConfirmPassword">Confirm Password</label>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm your password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-check mb-4">
                                    <asp:CheckBox ID="Terms" runat="server" CssClass="form-check-input" />
                                    <label class="form-check-label" for="Terms">
                                        I agree to the <a href="terms.html">Terms of Service</a> and <a href="privacy.html">Privacy Policy</a>
                                    </label>
                                </div>

                                <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary w-100" Text="Sign Up" OnClick="btnSignUp_Click" />

                                <div class="text-center mt-4">
                                    <p>Already have an account? <a href="login.aspx">Log in</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
