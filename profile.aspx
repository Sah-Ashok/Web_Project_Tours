<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Web_Project_Tours.profile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .main {
            padding-top: 80px;
            min-height: calc(100vh - 80px);
        }

        .profile-section {
            display: flex;
            align-items: center; /* vertical center */
            justify-content: center 
          
        }

        .profile-form-wrapper {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 600px;
        }

        .form-title {
            font-family: 'Raleway', sans-serif;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
        }
    </style>
    <center>
        <main class="main">
            <section class="profile-section">
                <div class="container">
                    <div class="profile-form-wrapper">
                        <h3 class="form-title">My Profile</h3>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Country</label>
                                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <hr />
                        <h5>Change Password</h5>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>New Password</label>
                                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Confirm Password</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary w-100" Text="Save Changes" OnClick="btnSave_Click" />
                    </div>
                </div>
            </section>
        </main>
    </center>
</asp:Content>

