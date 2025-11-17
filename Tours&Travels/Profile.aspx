<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Tours_Travels.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        .profile-header {
            background: linear-gradient(to right, var(--midnight-green), var(--dartmouth-green));
        }
        .profile-card {
            border: 1px solid #e5e7eb;
            background-color: #ffffff;
        }
        .profile-nav-link {
            display: block;
            padding: 1rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            color: #4b5563; /* text-gray-600 */
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            cursor: pointer;
        }
        .profile-nav-link i {
            margin-right: 1rem;
        }
        .profile-nav-link:hover {
            background-color: #f3f4f6; /* bg-gray-100 */
            color: var(--midnight-green);
        }
        .profile-nav-link.active {
            background-color: #eef8f4; /* A light green */
            color: var(--dartmouth-green);
            border-left-color: var(--dartmouth-green);
        }
        .tab-content { display: none; }
        .tab-content.active {
            display: block;
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .form-label {
            font-weight: 600;
            color: #374151; /* text-gray-700 */
        }
        .form-input-view {
            background-color: #f9fafb; /* bg-gray-50 */
            padding: 0.75rem 1rem;
            border-radius: 0.375rem;
            border: 1px solid #d1d5db; /* border-gray-300 */
        }
        .form-input-edit {
            padding: 0.75rem 1rem;
            border-radius: 0.375rem;
            border: 1px solid #d1d5db; /* border-gray-300 */
            width: 100%;
        }
        .form-input-edit:focus {
            border-color: var(--dartmouth-green);
            outline: none;
            box-shadow: 0 0 0 2px rgba(11, 110, 79, 0.2);
        }
        .wishlist-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .wishlist-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
        }
        .remove-wishlist-btn {
            position: absolute;
            top: 0.75rem;
            right: 0.75rem;
            background-color: rgba(255, 255, 255, 0.8);
            color: #ef4444; /* text-red-500 */
            border-radius: 50%;
            width: 2.25rem;
            height: 2.25rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            opacity: 0;
            border: none;
            cursor: pointer;
        }
        .wishlist-card:hover .remove-wishlist-btn { opacity: 1; }
        .remove-wishlist-btn:hover {
            background-color: #ef4444; /* bg-red-500 */
            color: white;
            transform: scale(1.1);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <main class="bg-gray-50">
            <!-- Profile Header -->
            <section class="profile-header text-white pt-32 pb-16" data-aos="fade-in">
                <div class="container mx-auto px-4 text-center">
                    <asp:Image ID="imgAvatar" runat="server" ImageUrl="~/Images/default-avatar.png" alt="User Avatar" CssClass="w-32 h-32 rounded-full mx-auto mb-4 border-4 border-white shadow-lg object-cover" />
                    <h1 class="text-4xl font-bold heading-font">
                        <asp:Literal ID="litWelcome" runat="server" Text="Welcome!" /></h1>
                    <p class="text-xl mt-2">Manage your profile, bookings, and wishlist.</p>
                </div>
            </section>

            <!-- Main Content -->
            <section class="py-16 md:py-24">
                <div class="container mx-auto px-4">
                     <asp:Label ID="lblMessage" runat="server" CssClass="block text-center text-lg font-semibold mb-4" />
                    <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
                        <!-- Left Sidebar Navigation -->
                        <aside class="lg:col-span-1" data-aos="fade-right">
                            <div class="profile-card rounded-lg p-6 sticky top-28">
                                <nav id="profile-nav" class="space-y-2">
                                    <a class="profile-nav-link active" data-tab="personal-details"><i class="bi bi-person-circle"></i>Personal Details</a>
                                    <a class="profile-nav-link" data-tab="booking-history"><i class="bi bi-briefcase-fill"></i>Booking History</a>
                                    <a class="profile-nav-link" data-tab="wishlist"><i class="bi bi-heart-fill"></i>My Wishlist</a>
                                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="profile-nav-link w-full text-left" OnClick="btnLogout_Click"><i class="bi bi-box-arrow-left"></i>Logout</asp:LinkButton>
                                </nav>
                            </div>
                        </aside>

                        <!-- Right Content Area -->
                        <div class="lg:col-span-3">
                            <!-- Personal Details Tab -->
							<div id="personal-details" class="tab-content active" data-aos="fade-up">
								<asp:Panel ID="pnlViewDetails" runat="server">
									<div class="profile-card rounded-lg p-8">
										<div class="flex justify-between items-center mb-6">
											<h2 class="text-3xl font-bold heading-font text-midnight-green">Personal Details</h2>
											<asp:Button ID="btnEditProfile" runat="server" Text="Edit" OnClick="btnEditProfile_Click" CssClass="px-5 py-2 rounded-full font-semibold text-white transition-transform hover:scale-105" Style="background-color: var(--dartmouth-green);" />
										</div>
										<div class="space-y-6">
											<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
												<div>
													<label class="form-label">First Name</label>
													<div class="form-input-view"><asp:Label ID="lblFirstName" runat="server" /></div>
												</div>
												<div>
													<label class="form-label">Last Name</label>
													<div class="form-input-view"><asp:Label ID="lblLastName" runat="server" /></div>
												</div>
											</div>
											<div>
												<label class="form-label">Email Address</label>
												<div class="form-input-view"><asp:Label ID="lblEmail" runat="server" /></div>
											</div>
											<div>
												<label class="form-label">Phone Number</label>
												<div class="form-input-view"><asp:Label ID="lblPhone" runat="server" /></div>
											</div>
											<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
												<div>
													<label class="form-label">Country</label>
													<div class="form-input-view"><asp:Label ID="lblCountry" runat="server" /></div>
												</div>
												<div>
													<label class="form-label">State</label>
													<div class="form-input-view"><asp:Label ID="lblState" runat="server" /></div>
												</div>
											</div>
                                            <div>
                                                <label class="form-label">City</label>
                                                <div class="form-input-view"><asp:Label ID="lblCity" runat="server" /></div>
                                            </div>
										</div>
									</div>
								</asp:Panel>
								<asp:Panel ID="pnlEditDetails" runat="server" Visible="false">
									<div class="profile-card rounded-lg p-8">
										<h2 class="text-3xl font-bold heading-font text-midnight-green mb-6">Edit Details</h2>
										<div class="space-y-6">
											<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
												<div>
													<label class="form-label">First Name</label>
													<asp:TextBox ID="txtFirstName" runat="server" CssClass="form-input-edit" />
												</div>
												<div>
													<label class="form-label">Last Name</label>
													<asp:TextBox ID="txtLastName" runat="server" CssClass="form-input-edit" />
												</div>
											</div>
											<div>
												<label class="form-label">Phone Number</label>
												<asp:TextBox ID="txtPhone" runat="server" CssClass="form-input-edit" />
											</div>
											<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
												<div>
													<label class="form-label">Country</label>
													<asp:TextBox ID="txtCountry" runat="server" CssClass="form-input-edit" />
												</div>
												<div>
													<label class="form-label">State</label>
													<asp:TextBox ID="txtState" runat="server" CssClass="form-input-edit" />
												</div>
											</div>
                                             <div>
                                                <label class="form-label">City</label>
                                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-input-edit" />
                                            </div>
											<div>
												<label class="form-label">Update Profile Image</label>
												<asp:FileUpload ID="fuProfileImage" runat="server" CssClass="block w-full text-sm text-slate-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-violet-50 file:text-violet-700 hover:file:bg-violet-100" />
											</div>
											<div class="flex justify-end gap-4">
												<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="px-6 py-3 rounded-full font-semibold bg-gray-200 text-gray-700 hover:bg-gray-300 transition-transform hover:scale-105" />
												<asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="btnSaveChanges_Click" CssClass="px-6 py-3 rounded-full font-semibold text-white transition-transform hover:scale-105" Style="background-color: var(--dartmouth-green);" />
											</div>
										</div>
									</div>
								</asp:Panel>
								<div class="profile-card rounded-lg p-8 mt-8">
									<h2 class="text-3xl font-bold heading-font text-midnight-green mb-6">Change Password</h2>
									<div class="space-y-6">
										<div>
											<label class="form-label">Current Password</label>
											<asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="form-input-edit" placeholder="Enter current password" />
										</div>
										<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
											<div>
												<label class="form-label">New Password</label>
												<asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-input-edit" placeholder="Enter new password" />
											</div>
											<div>
												<label class="form-label">Confirm New Password</label>
												<asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-input-edit" placeholder="Confirm new password" />
											</div>
										</div>
										<div class="flex justify-end">
											<asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click" CssClass="px-6 py-3 rounded-full font-semibold text-white transition-transform hover:scale-105" Style="background-color: var(--dartmouth-green);" />
										</div>
									</div>
								</div>
							</div>

                            <!-- Booking History Tab -->
                            <div id="booking-history" class="tab-content" data-aos="fade-up">
                                <div class="profile-card rounded-lg p-8">
                                    <h2 class="text-3xl font-bold heading-font text-midnight-green mb-6">Booking History</h2>
                                    <div class="space-y-6">
                                        <!-- Static Booking Item 1 -->
                                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg border">
                                            <div class="flex items-center gap-4">
                                                <img src="https://images.unsplash.com/photo-1522093007474-d86e9bf7ba6f?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" alt="Paris" class="w-20 h-20 rounded-lg object-cover">
                                                <div>
                                                    <h3 class="text-xl font-bold text-midnight-green">Paris, France</h3>
                                                    <p class="text-gray-600">Date: 15 Oct 2024 - 22 Oct 2024</p>
                                                </div>
                                            </div>
                                            <span class="px-3 py-1 text-sm font-semibold text-green-800 bg-green-100 rounded-full">Upcoming</span>
                                        </div>
                                        <!-- Static Booking Item 2 -->
                                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg border">
                                            <div class="flex items-center gap-4">
                                                <img src="https://images.unsplash.com/photo-1542051841857-5f90071e7989?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" alt="Tokyo" class="w-20 h-20 rounded-lg object-cover">
                                                <div>
                                                    <h3 class="text-xl font-bold text-midnight-green">Tokyo, Japan</h3>
                                                    <p class="text-gray-600">Date: 20 May 2024 - 28 May 2024</p>
                                                </div>
                                            </div>
                                            <span class="px-3 py-1 text-sm font-semibold text-gray-800 bg-gray-200 rounded-full">Completed</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Wishlist Tab -->
                            <div id="wishlist" class="tab-content" data-aos="fade-up">
                                <div class="profile-card rounded-lg p-8">
                                    <h2 class="text-3xl font-bold heading-font text-midnight-green mb-6">My Wishlist</h2>
                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                        <!-- Static Wishlist Item 1 -->
                                        <div class="bg-white rounded-lg overflow-hidden border wishlist-card relative">
                                            <div class="h-48 overflow-hidden">
                                                <img src="https://images.unsplash.com/photo-1533105079780-52b9be462077?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Santorini" class="w-full h-full object-cover">
                                            </div>
                                            <div class="p-5">
                                                <h3 class="text-xl font-bold heading-font mb-2">Santorini, Greece</h3>
                                                <a href="#" class="font-semibold text-dartmouth-green hover:underline">View Details</a>
                                            </div>
                                            <button class="remove-wishlist-btn" title="Remove from Wishlist"><i class="bi bi-x-lg"></i></button>
                                        </div>
                                        <!-- Static Wishlist Item 2 -->
                                        <div class="bg-white rounded-lg overflow-hidden border wishlist-card relative">
                                            <div class="h-48 overflow-hidden">
                                                <img src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Bora Bora" class="w-full h-full object-cover">
                                            </div>
                                            <div class="p-5">
                                                <h3 class="text-xl font-bold heading-font mb-2">Bora Bora</h3>
                                                <a href="#" class="font-semibold text-dartmouth-green hover:underline">View Details</a>
                                            </div>
                                            <button class="remove-wishlist-btn" title="Remove from Wishlist"><i class="bi bi-x-lg"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </main>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navLinks = document.querySelectorAll('#profile-nav a, #profile-nav .profile-nav-link');
            const tabContents = document.querySelectorAll('.tab-content');

            navLinks.forEach(link => {
                // Check if the link is not the ASP.NET Logout button
                if (!link.id.includes('btnLogout')) {
                    link.addEventListener('click', e => {
                        e.preventDefault();

                        const tabId = link.getAttribute('data-tab');
                        if (!tabId) return;

                        // Update active state on nav links
                        navLinks.forEach(nav => {
                            if (!nav.id.includes('btnLogout')) {
                                nav.classList.remove('active');
                            }
                        });
                        link.classList.add('active');

                        // Update active state on tab content
                        tabContents.forEach(content => {
                            content.classList.remove('active');
                            if (content.id === tabId) {
                                content.classList.add('active');
                            }
                        });
                    });
                }
            });
        });
    </script>
</asp:Content>