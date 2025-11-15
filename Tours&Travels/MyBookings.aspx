<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="Tours_Travels.MyBookings" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Existing Styles */
        .hero-section::before {
            content: '';
            position: absolute;
            inset: 0;
            background-color: rgba(7, 59, 58, 0.6);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .booking-card {
            transition: all 0.3s ease;
            border: 1px solid #e5e7eb;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }

        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.875rem;
            font-weight: 600;
            display: inline-block;
        }

        /* New Style for View Details Button (Replaces Cancel Button Style) */
        .view-details-btn {
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-weight: 600;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            border: 1px solid transparent;
            background-color: #d1fae5; /* A light green background */
            color: #059669; /* A strong green text color (Emerald 600) */
        }

        .view-details-btn:hover {
            background-color: #059669; /* Strong green background on hover */
            color: white;
            transform: scale(1.05);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <main>
            <section class="hero-section relative h-80 w-full bg-cover bg-center flex items-center justify-center text-white" data-aos="fade-in"
                style="background-image: url('https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?auto=format&fit=crop&w=1920&q=80');">
                <div class="hero-content text-center container mx-auto px-4" data-aos="fade-up">
                    <h1 class="text-4xl md:text-6xl font-bold heading-font mb-4">My Bookings</h1>
                    <p class="text-lg md:text-xl max-w-3xl mx-auto">Review your past and upcoming adventures with us.</p>
                </div>
            </section>

            <section class="py-16 md:py-24 bg-gray-50">
                <div class="container mx-auto px-4">

                    <asp:Panel ID="pnlBookings" runat="server">
                        <div class="space-y-8">
                            <asp:Repeater ID="rptBookings" runat="server" OnItemDataBound="rptBookings_ItemDataBound">
                                <ItemTemplate>
                                    <div class="booking-card bg-white rounded-lg shadow-md overflow-hidden flex flex-col md:flex-row" data-aos="fade-up">
                                        <div class="w-full h-64 md:w-1/3 md:h-auto bg-cover bg-center" style='background-image: url("<%# Eval("MainImage") %>")'>
                                        </div>
                                        <div class="p-6 flex flex-col flex-grow">
                                            <div class="flex justify-between items-start mb-2">
                                                <h2 class="text-2xl font-bold heading-font text-midnight-green">
                                                    <asp:Label ID="lblDestinationName" runat="server" Text='<%# Eval("DestinationName") %>'></asp:Label>
                                                </h2>
                                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                            </div>
                                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-3 text-text-light my-4">
                                                <div class="flex items-center gap-2">
                                                    <i class="las la-calendar-check text-xl text-dartmouth-green"></i><strong>Travel Date:</strong>
                                                    <asp:Label ID="lblTravelDate" runat="server" Text='<%# Convert.ToDateTime(Eval("TravelDate")).ToString("dd MMM, yyyy") %>'></asp:Label>
                                                </div>
                                                <div class="flex items-center gap-2">
                                                    <i class="las la-calendar-times text-xl text-dartmouth-green"></i><strong>Return Date:</strong>
                                                    <asp:Label ID="lblReturnDate" runat="server"></asp:Label>
                                                </div>
                                                <div class="flex items-center gap-2">
                                                    <i class="las la-users text-xl text-dartmouth-green"></i><strong>Travelers:</strong>
                                                    <asp:Label ID="lblTravelers" runat="server" Text='<%# Convert.ToInt32(Eval("NumberOfAdults")) + Convert.ToInt32(Eval("NumberOfChildren")) %>'></asp:Label>
                                                </div>
                                                <div class="flex items-center gap-2">
                                                    <i class="las la-money-bill-wave text-xl text-dartmouth-green"></i><strong>Total Paid:</strong>
                                                    <asp:Label ID="lblTotalPaid" runat="server" Text='<%# "₹" + Convert.ToDecimal(Eval("TotalAmount")).ToString("N0") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="pt-4 mt-4 border-t">
                                                <h3 class="font-semibold text-lg text-midnight-green mb-2">Booked For</h3>
                                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-3 text-text-light">
                                                    <div class="flex items-center gap-2">
                                                        <i class="las la-user-check text-xl text-dartmouth-green"></i><strong>Name:</strong>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("TravelerFirstName") + " " + Eval("TravelerLastName") %>'></asp:Label>
                                                    </div>
                                                    <div class="flex items-center gap-2">
                                                        <i class="las la-phone text-xl text-dartmouth-green"></i><strong>Phone:</strong>
                                                        <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("TravelerPhone") %>'></asp:Label>
                                                    </div>
                                                    <div class="sm:col-span-2 flex items-center gap-2">
                                                        <i class="las la-envelope text-xl text-dartmouth-green"></i><strong>Email:</strong>
                                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("TravelerEmail") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-auto pt-4 border-t flex justify-between items-center">
                                                <a href='<%# "ViewDetails.aspx?id=" + Eval("DestinationId") %>' class="font-semibold text-dartmouth-green hover:underline">View Destination Details</a>
                                                
                                                <!-- REPLACED LinkButton with HyperLink -->
                                                <asp:HyperLink ID="hlViewBookingDetails" runat="server" CssClass="view-details-btn" NavigateUrl='<%# "ViewBookingDetails.aspx?bookingId=" + Eval("BookingId") %>'>
                                                    <i class="las la-info-circle"></i> View Booking Details
                                                </asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlNoBookings" runat="server" Visible="false">
                        <div class="text-center py-12" data-aos="fade-up">
                            <i class="las la-suitcase-rolling text-7xl text-gray-300"></i>
                            <h2 class="text-3xl font-bold heading-font mt-4">No Adventures Booked Yet!</h2>
                            <p class="text-text-light mt-2 text-lg">Your next great story is just a click away.</p>
                            <a href="Destination.aspx" class="inline-block mt-6 px-8 py-3 rounded-full font-semibold text-white transition-transform hover:scale-105" style="background-color: var(--dartmouth-green);">Explore Destinations</a>
                        </div>
                    </asp:Panel>

                </div>
            </section>
        </main>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>