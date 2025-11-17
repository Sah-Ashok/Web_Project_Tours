<%@ Page Title="Booking Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBookingDetails.aspx.cs" Inherits="Tours_Travels.ViewBookingDetails" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --dartmouth-green: #0b6e4f;
            --midnight-green: #073b3a;
            --text-light: #6b7280;
        }
        .hero-section::before {
            content: '';
            position: absolute;
            inset: 0;
            background-color: rgba(7, 59, 58, 0.7);
            z-index: 1;
        }
        .hero-content { position: relative; z-index:2; }
        .detail-card { border:1px solid #e5e7eb; background:white; border-radius:0.75rem; padding:2.5rem; box-shadow:0 10px 15px rgba(0,0,0,0.06); }
        .status-badge { padding:0.25rem 0.75rem; border-radius:9999px; font-size:0.875rem; font-weight:600; display:inline-block; }
        .section-heading { border-bottom:2px solid #e5e7eb; padding-bottom:0.5rem; margin-bottom:1.5rem; color:var(--midnight-green); }

        .btn-cancel {
            background-color: #ef4444;
            color: white;
            padding: 0.6rem 1rem;
            border-radius: 0.5rem;
            font-weight: 700;
            border: none;
            cursor: pointer;
        }
        .btn-cancel:hover { background-color: #dc2626; }

        .info-box { padding: 1rem; border-radius: 0.5rem; margin-bottom: 1rem; }
        .info-success { background: #ecfdf5; border-left: 4px solid #10b981; color: #065f46; }
        .info-error { background: #ffefef; border-left: 4px solid #ef4444; color: #7f1d1d; }
    </style>

    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/css/line-awesome.min.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <main>
            <section class="hero-section relative h-80 w-full bg-cover bg-center flex items-center justify-center text-white" data-aos="fade-in"
                     style="background-image: url('https://images.unsplash.com/photo-1542241517-578f72c72473?auto=format&fit=crop&w=1920&q=80');">
                <div class="hero-content text-center container mx-auto px-4" data-aos="fade-up">
                    <h1 class="text-4xl md:text-6xl font-bold heading-font mb-4">Booking Details</h1>
                    <p class="text-lg md:text-xl max-w-3xl mx-auto">Full details for your exciting adventure.</p>
                </div>
            </section>

            <section class="py-16 md:py-24 bg-gray-50">
                <div class="container mx-auto px-4 max-w-7xl">

                    <asp:Panel ID="pnlBookingDetails" runat="server" Visible="false" CssClass="detail-card">

                        <div class="flex flex-col md:flex-row justify-between items-start mb-10 pb-4 border-b">
                            <h2 class="text-3xl font-bold heading-font text-midnight-green mb-4 md:mb-0 flex items-center gap-3">
                                <i class="las la-map-marked-alt text-4xl text-dartmouth-green"></i>
                                Trip: <asp:Label ID="lblDestinationName" runat="server" Text="[Destination Name]"></asp:Label>
                            </h2>
                            <div class="text-right">
                                <span class="text-xs font-medium text-gray-500 block">Current Status</span>
                                <asp:Label ID="lblStatus" runat="server" CssClass="status-badge" style="background-color:#d1fae5;color:#059669;"></asp:Label>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 lg:grid-cols-3 gap-10">

                            <div class="lg:col-span-1">
                                <h3 class="text-xl font-semibold section-heading">Trip Summary</h3>
                                <div class="space-y-4 text-text-light">
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-calendar-alt text-2xl text-dartmouth-green"></i>
                                        <strong>Date of Booking:</strong> <asp:Label ID="lblDateOfBooking" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-plane-departure text-2xl text-dartmouth-green"></i>
                                        <strong>Travel Date:</strong> <asp:Label ID="lblTravelDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-plane-arrival text-2xl text-dartmouth-green"></i>
                                        <strong>Return Date:</strong> <asp:Label ID="lblReturnDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-users text-2xl text-dartmouth-green"></i>
                                        <strong>Total Travelers:</strong> <asp:Label ID="lblTravelers" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-bed text-2xl text-dartmouth-green"></i>
                                        <strong>Room Selected:</strong> <asp:Label ID="lblRoomSelection" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-utensils text-2xl text-dartmouth-green"></i>
                                        <strong>Meal Preference:</strong> <asp:Label ID="lblMealPreference" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="lg:col-span-1">
                                <h3 class="text-xl font-semibold section-heading">Traveler Information</h3>
                                <div class="space-y-4 text-text-light">
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-user-circle text-2xl text-dartmouth-green"></i>
                                        <strong>Booked For:</strong> <asp:Label ID="lblTravelerName" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-envelope text-2xl text-dartmouth-green"></i>
                                        <strong>Email:</strong> <asp:Label ID="lblTravelerEmail" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-phone text-2xl text-dartmouth-green"></i>
                                        <strong>Phone:</strong> <asp:Label ID="lblTravelerPhone" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-map-marker-alt text-2xl text-dartmouth-green"></i>
                                        <strong>Location:</strong> <asp:Label ID="lblTravelerCity" runat="server"></asp:Label>, <asp:Label ID="lblTravelerCountry" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-passport text-2xl text-dartmouth-green"></i>
                                        <strong>Passport No:</strong> <asp:Label ID="lblPassportNumber" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="lg:col-span-1">
                                <h3 class="text-xl font-semibold section-heading">Payment & Actions</h3>
                                <div class="space-y-4 text-text-light">
                                    <div class="detail-item flex justify-between items-center text-lg font-medium">
                                        <strong>Total Paid:</strong> <asp:Label ID="lblTotalAmount" runat="server" CssClass="text-dartmouth-green"></asp:Label>
                                    </div>
                                    <div class="detail-item flex items-center gap-3">
                                        <i class="las la-credit-card text-2xl text-dartmouth-green"></i>
                                        <strong>Payment Status:</strong> <asp:Label ID="lblPaymentStatus" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item">
                                        <strong>Order ID:</strong> <asp:Label ID="lblOrderId" runat="server"></asp:Label>
                                    </div>
                                    <div class="detail-item">
                                        <!-- This is the corrected line -->
                                        <strong>Payment ID:</strong> <asp:Label ID="lblPaymentId" runat="server"></asp:Label>
                                    </div>

                                    <div class="pt-4">
                                        <asp:Button ID="btnCancelBooking" runat="server" Text="Cancel Booking" CssClass="btn-cancel" OnClick="btnCancelBooking_Click" Visible="false" />
                                    </div>

                                    <asp:Panel ID="pnlCancelResult" runat="server" Visible="false" CssClass="mt-4">
                                        <asp:Label ID="lblCancelMessage" runat="server"></asp:Label>
                                    </asp:Panel>

                                    <asp:Panel ID="pnlRefundInfo" runat="server" Visible="false" CssClass="mt-4">
                                        <div class="info-box info-success">
                                            <strong>Refund Processed</strong>
                                            <div class="mt-2">
                                                <p><strong>Refund ID:</strong> <asp:Label ID="lblRefundId" runat="server"></asp:Label></p>
                                                <p><strong>Amount Refunded:</strong> <asp:Label ID="lblRefundedAmount" runat="server"></asp:Label></p>
                                                <p><strong>Payment Status (now):</strong> <asp:Label ID="lblPaymentStatusAfter" runat="server"></asp:Label></p>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                </div>
                            </div>
                        </div>

                    </asp:Panel>

                    <asp:Panel ID="pnlNotFound" runat="server" Visible="true">
                        <div class="text-center py-12 bg-white rounded-xl shadow-lg" data-aos="fade-up">
                            <i class="las la-exclamation-triangle text-7xl text-red-500"></i>
                            <h2 class="text-3xl font-bold heading-font mt-4">Booking Not Found</h2>
                            <p class="text-text-light mt-2 text-lg">The booking ID provided does not exist or you do not have permission to view it.</p>
                            <a href="MyBookings.aspx" class="inline-block mt-6 px-8 py-3 rounded-full font-semibold text-white transition-transform hover:scale-105" style="background-color: var(--dartmouth-green);">Back to My Bookings</a>
                        </div>
                    </asp:Panel>

                </div>
            </section>
        </main>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            if (typeof AOS !== 'undefined') { AOS.init({ once: true }); }
        });
    </script>
</asp:Content>