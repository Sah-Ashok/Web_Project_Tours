<%@ Page Title="Booking Confirmation" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookingConfirmation.aspx.cs" Inherits="Tours_Travels.bookingConfirmation" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Existing Styles --- */
        :root {
            --dartmouth-green: #0b6e4f;
            --pigment-green: #0d8360;
            --midnight-green: #073b3a;
            --text-light: #6b7280;
            --text-dark: #1f2937;
        }
        
        .hero-section {
            position: relative;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            inset: 0;
            background-color: rgba(11, 110, 79, 0.5);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 8px rgba(0,0,0,0.5);
        }

        .form-group {
            position: relative;
        }

        .form-input {
            transition: all 0.3s ease;
            border: 2px solid #d1d5db;
            background-color: #f9fafb;
        }

        .form-input:focus {
            border-color: var(--dartmouth-green);
            box-shadow: 0 0 0 3px rgba(11, 110, 79, 0.2);
        }

        .form-label {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 2.75rem;
            transition: all 0.2s ease-in-out;
            pointer-events: none;
            color: var(--text-light);
            background-color: #f9fafb;
            padding: 0 4px;
        }

        .form-input:focus ~ .form-label,
        .form-input:not(:placeholder-shown) ~ .form-label {
            top: 0;
            left: 1rem;
            font-size: 0.75rem;
            color: var(--dartmouth-green);
            font-weight: 600;
        }

        .quantity-btn {
            background-color: #f3f4f6;
            border-radius: 9999px;
            width: 32px;
            height: 32px;
            transition: background-color 0.2s;
            border: 1px solid #d1d5db;
            color: black !important;
            font-size: 1.25rem;
            font-weight: 700;
            cursor: pointer;
            line-height: 1;
        }

        .quantity-btn:hover {
            background-color: #e5e7eb;
        }

        .quantity-btn[disabled], .quantity-btn.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .confirm-btn {
            background-image: linear-gradient(to right, var(--dartmouth-green) 0%, var(--pigment-green) 100%);
            transition: all 0.3s ease;
        }

        .confirm-btn:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 10px 20px -5px rgba(11, 110, 79, 0.4);
        }

        /* Visual Radio/Checkbox Cards */
        .visual-choice-group .choice-card {
            border: 2px solid #e5e7eb;
            border-radius: 0.75rem;
            padding: 1rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s ease;
            position: relative;
            background-color: #fff;
            overflow: hidden; 
        }
        .visual-choice-group input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }
        /* Default icon color (dark green) */
        .choice-card-icon {
            font-size: 2.5rem;
            color: var(--dartmouth-green);
            margin-bottom: 0.5rem;
            display: block;
            transition: color 0.2s ease;
        }
        .choice-card-label {
            font-weight: 600;
            color: #374151;
            transition: color 0.2s ease;
        }
        
        /* --- MODIFICATIONS START (Selector Fix) --- */

        /* 1. Hover Effect on UNCHECKED Card */
        .visual-choice-group .choice-card:hover {
            border-color: var(--pigment-green);
            transform: translateY(-2px);
            background-color: #f9f9f9; 
        }

        /* 2. Checked State: Green Background and White Text/Icon */
        .visual-choice-group input[type="radio"]:checked + label .choice-card {
            border-color: var(--midnight-green);
            background-color: var(--dartmouth-green); 
            box-shadow: 0 0 0 2px var(--dartmouth-green);
            transform: none; 
        }
        
        /* Change icon color inside the checked card to white */
        .visual-choice-group input[type="radio"]:checked + label .choice-card-icon {
            color: white;
        }
        
        /* Change label text color inside the checked card to white */
        .visual-choice-group input[type="radio"]:checked + label .choice-card-label {
            color: white;
        }

        /* 3. Hover effect on CHECKED Card (make it slightly darker or add a shadow) */
        .visual-choice-group input[type="radio"]:checked + label .choice-card:hover {
            background-color: var(--midnight-green); 
            border-color: var(--midnight-green);
            box-shadow: 0 4px 10px -2px rgba(7, 59, 58, 0.5); 
        }
        /* --- MODIFICATIONS END (Selector Fix) */
        
        /* Price Hover Styles */
        .choice-card-price {
            position: absolute;
            bottom: -100%; 
            left: 0;
            right: 0;
            background-color: rgba(7, 59, 58, 0.9); 
            color: white;
            padding: 0.5rem;
            font-size: 0.875rem;
            font-weight: 700;
            transition: bottom 0.3s ease-in-out;
            text-align: center;
        }
        .choice-card:hover .choice-card-price {
            bottom: 0; 
        }

        /* Improved Summary Box */
        .summary-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 0;
        }
        .summary-item-label {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: #4b5563;
        }
        .summary-item-value {
            font-weight: 600;
            color: #1f2937;
        }
        .summary-total {
            border-top: 2px solid var(--dartmouth-green);
            margin-top: 1rem;
            padding-top: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--dartmouth-green);
        }

        /* --- STICKY FIX --- */
        .sticky-container {
            display: grid;
            /* Default: single column */
            grid-template-columns: repeat(1, minmax(0, 1fr));
            gap: 3rem; /* 48px, same as gap-12 */
            align-items: flex-start;
        }

        @media (min-width: 1024px) { /* lg breakpoint */
            .sticky-container {
                /* Use a 3-column implicit grid layout, where the form takes 2/3 and summary takes 1/3 */
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }
            .sticky-form-content {
                /* Form content occupies the first two columns */
                grid-column: span 2 / span 2;
            }
            .sticky-summary {
                /* Summary content occupies the last column and is sticky */
                grid-column: span 1 / span 1;
                position: -webkit-sticky; /* For Safari */
                position: sticky;
                top: 2rem; /* Keep 2rem (approx 8 units) gap from the top of the viewport when scrolling */
                z-index: 10;
            }
        }
    </style>
    <!-- Tailwind CSS CDN - Assuming it's loaded in Site1.Master, but including for completeness -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Use Line Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/css/line-awesome.min.css">
    
    <!-- RAZORPAY SDK INTEGRATION -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <main>
            <asp:Panel ID="pnlHero" runat="server" CssClass="hero-section h-80 md:h-96 w-full bg-cover bg-center" data-aos="fade-in"
                Style="background-image: url('https://images.unsplash.com/photo-1526772662000-3f88f10405ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
                <div class="hero-content container mx-auto px-4" data-aos="fade-up">
                    <h1 class="text-4xl md:text-6xl font-bold heading-font mb-4">Secure Your Booking</h1>
                    <p class="text-lg md:text-xl max-w-3xl mx-auto">Complete the final steps to begin your unforgettable adventure.</p>
                </div>
            </asp:Panel>

            <section class="py-16 md:py-24">
                <div class="container mx-auto px-4">

                    <asp:UpdatePanel ID="UpdatePanelBooking" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlBookingContent" runat="server" Visible="true">
                                <div class="sticky-container">
                                    <%-- FORM CONTENT - now uses the 'sticky-form-content' grid class --%>
                                    <div class="sticky-form-content bg-white p-8 rounded-lg shadow-xl">
                                        <div>
                                            <h2 class="text-3xl font-bold heading-font mb-8 text-midnight-green">Traveler Information</h2>
                                            <asp:Label ID="lblMessage" runat="server" CssClass="block text-center text-sm font-semibold mb-2" ForeColor="Red"></asp:Label>

                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                                <div class="form-group relative">
                                                    <i class="las la-user absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label1" runat="server" AssociatedControlID="txtFirstName" CssClass="form-label">First Name</asp:Label>
                                                </div>
                                                <div class="form-group relative">
                                                    <i class="las la-user absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label2" runat="server" AssociatedControlID="txtLastName" CssClass="form-label">Last Name</asp:Label>
                                                </div>
                                                <div class="md:col-span-2 form-group relative">
                                                    <i class="las la-envelope absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" TextMode="Email" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label3" runat="server" AssociatedControlID="txtEmail" CssClass="form-label">Email Address</asp:Label>
                                                </div>
                                                <div class="form-group relative">
                                                    <i class="las la-phone absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" TextMode="Phone" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label4" runat="server" AssociatedControlID="txtPhone" CssClass="form-label">Phone Number</asp:Label>
                                                </div>
                                                <div class="form-group relative">
                                                    <i class="las la-calendar-check absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtBookingDate" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" TextMode="Date" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label5" runat="server" AssociatedControlID="txtBookingDate" CssClass="form-label">Booking Date</asp:Label>
                                                </div>
                                                <div class="form-group relative">
                                                    <i class="las la-passport absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtPassportNumber" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label10" runat="server" AssociatedControlID="txtPassportNumber" CssClass="form-label">Passport Number</asp:Label>
                                                </div>
                                                <div class="form-group relative">
                                                    <i class="las la-calendar-day absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtPassportExpiry" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" TextMode="Date" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label11" runat="server" AssociatedControlID="txtPassportExpiry" CssClass="form-label">Passport Expiry</asp:Label>
                                                </div>
                                                <div class="form-group relative">
                                                    <i class="las la-city absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtCity" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label12" runat="server" AssociatedControlID="txtCity" CssClass="form-label">City</asp:Label>
                                                </div>
                                                <div class="form-group relative">
                                                    <i class="las la-globe-americas absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtCountry" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label13" runat="server" AssociatedControlID="txtCountry" CssClass="form-label">Country</asp:Label>
                                                </div>
                                            </div>

                                            <div class="mt-10">
                                                <h3 class="text-xl font-bold heading-font mb-4 text-midnight-green">Preferences</h3>

                                                <div class="mb-8">
                                                    <asp:Label ID="Label14" runat="server" CssClass="font-semibold text-text-dark mb-3 block">Who are you booking for?</asp:Label>
                                                    <%-- FIX: Added Text="" to all ListItems below --%>
                                                    <asp:RadioButtonList ID="rblBookingFor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="visual-choice-group grid grid-cols-2 md:grid-cols-3 gap-4"
                                                        AutoPostBack="true" OnSelectedIndexChanged="CalculateAndUpdateSummary">
                                                        <asp:ListItem Value="Self" Selected="True" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-user choice-card-icon"></i>
                                                                <span class="choice-card-label">Booking for Self</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Family" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-users choice-card-icon"></i>
                                                                <span class="choice-card-label">For my Family</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Friends" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-user-friends choice-card-icon"></i>
                                                                <span class="choice-card-label">For Friends</span>
                                                            </div>
                                                        </asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>

                                                <%-- MEAL PREFERENCE: ADDED AUTOPOSTBACK and Text="" --%>
                                                <div class="mb-8">
                                                    <asp:Label ID="Label6" runat="server" CssClass="font-semibold text-text-dark mb-3 block">Meal Preference</asp:Label>
                                                    <asp:RadioButtonList ID="rblMealPreference" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="visual-choice-group grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-3"
                                                        AutoPostBack="true" OnSelectedIndexChanged="CalculateAndUpdateSummary">
                                                        <asp:ListItem Value="Any" Selected="True" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-utensils choice-card-icon"></i>
                                                                <span class="choice-card-label">Any</span>
                                                                <span class="choice-card-price">Included</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Vegetarian" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-leaf choice-card-icon"></i>
                                                                <span class="choice-card-label">Vegetarian</span>
                                                                <span class="choice-card-price">Included</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Vegan" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-seedling choice-card-icon"></i>
                                                                <span class="choice-card-label">Vegan</span>
                                                                <span class="choice-card-price">+ ₹800</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Non-Vegetarian" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-drumstick-bite choice-card-icon"></i>
                                                                <span class="choice-card-label">Non-Veg</span>
                                                                <span class="choice-card-price">Included</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Gluten-Free" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-bread-slice choice-card-icon"></i>
                                                                <span class="choice-card-label">Gluten-Free</span>
                                                                <span class="choice-card-price">+ ₹1,000</span>
                                                            </div>
                                                        </asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>

                                                <%-- ROOM SELECTION: ADDED AUTOPOSTBACK and Text="" --%>
                                                <div class="mb-8">
                                                    <asp:Label ID="Label7" runat="server" CssClass="font-semibold text-text-dark mb-3 block">Room Selection</asp:Label>
                                                    <asp:RadioButtonList ID="rblRoomSelection" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="visual-choice-group grid grid-cols-2 md:grid-cols-4 gap-4"
                                                        AutoPostBack="true" OnSelectedIndexChanged="CalculateAndUpdateSummary">
                                                        <asp:ListItem Value="Standard Room" Selected="True" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-bed choice-card-icon"></i>
                                                                <span class="choice-card-label">Standard</span>
                                                                <span class="choice-card-price">Included</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Deluxe Room" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-concierge-bell choice-card-icon"></i>
                                                                <span class="choice-card-label">Deluxe</span>
                                                                <span class="choice-card-price">+ ₹5,000</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Suite" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-crown choice-card-icon"></i>
                                                                <span class="choice-card-label">Suite</span>
                                                                <span class="choice-card-price">+ ₹12,000</span>
                                                            </div>
                                                        </asp:ListItem>
                                                        <asp:ListItem Value="Family Room" Text="">
                                                            <div class="choice-card">
                                                                <i class="las la-users choice-card-icon"></i>
                                                                <span class="choice-card-label">Family</span>
                                                                <span class="choice-card-price">Included</span>
                                                            </div>
                                                        </asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>

                                                <div class="form-group relative">
                                                    <i class="las la-comment-dots absolute left-4 top-6 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                    <asp:TextBox ID="txtSpecialRequests" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-full p-4 pl-12 form-input rounded-md" placeholder=" "></asp:TextBox>
                                                    <asp:Label ID="Label8" runat="server" AssociatedControlID="txtSpecialRequests" CssClass="form-label">Special Requests (Optional)</asp:Label>
                                                </div>

                                                <div class="mt-8 space-y-6">
                                                    <div class="form-group relative">
                                                        <i class="las la-ticket-alt absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 z-10 text-xl"></i>
                                                        <asp:TextBox ID="txtTicketEmail" runat="server" CssClass="w-full p-4 pl-12 form-input rounded-md" TextMode="Email" placeholder=" "></asp:TextBox>
                                                        <asp:Label ID="Label15" runat="server" AssociatedControlID="txtTicketEmail" CssClass="form-label">Send Ticket to Email (Optional)</asp:Label>
                                                    </div>

                                                    <%-- INSURANCE CHECKBOX: ADDED AUTOPOSTBACK --%>
                                                    <div class="flex items-center">
                                                        <asp:CheckBox ID="chkTravelInsurance" runat="server" CssClass="h-5 w-5 rounded text-dartmouth-green focus:ring-pigment-green"
                                                            AutoPostBack="true" OnCheckedChanged="CalculateAndUpdateSummary"/>
                                                        <asp:Label ID="Label9" runat="server" AssociatedControlID="chkTravelInsurance" CssClass="ml-3 font-semibold text-text-dark cursor-pointer">Add Travel Insurance ($50 per person)</asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="md:col-span-2 mt-10">
                                                <h3 class="text-xl font-bold heading-font mb-4 text-midnight-green">Number of Travelers</h3>
                                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 bg-gray-50 p-6 rounded-lg border">
                                                    <div>
                                                        <label class="font-semibold text-text-dark">Adults</label>
                                                        <div class="flex items-center gap-4 mt-2">
                                                            <asp:Button ID="btnAdultsDecrement" runat="server" Text="-" OnClick="Quantity_Click" CommandArgument="Adults_Decrement" CssClass="quantity-btn" />
                                                            <asp:Label ID="lblAdultsCount" runat="server" Text="1" CssClass="font-bold text-xl w-8 text-center"></asp:Label>
                                                            <asp:Button ID="btnAdultsIncrement" runat="server" Text="+" OnClick="Quantity_Click" CommandArgument="Adults_Increment" CssClass="quantity-btn" />
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <label class="font-semibold text-text-dark">Children</label>
                                                        <div class="flex items-center gap-4 mt-2">
                                                            <asp:Button ID="btnChildrenDecrement" runat="server" Text="-" OnClick="Quantity_Click" CommandArgument="Children_Decrement" CssClass="quantity-btn" />
                                                            <asp:Label ID="lblChildrenCount" runat="server" Text="0" CssClass="font-bold text-xl w-8 text-center"></asp:Label>
                                                            <asp:Button ID="btnChildrenIncrement" runat="server" Text="+" OnClick="Quantity_Click" CommandArgument="Children_Increment" CssClass="quantity-btn" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- TRIP SUMMARY - NOW HAS STICKY CLASS AND NEW LABELS --%>
                                    <div class="sticky-summary">
                                        <div>
                                            <div class="bg-white rounded-lg shadow-xl p-6 border-t-4 border-t-dartmouth-green">
                                                <h3 class="text-2xl font-bold heading-font text-midnight-green mb-4 border-b pb-4">Your Trip Summary</h3>
                                                <div class="flex items-center gap-4">
                                                    <asp:Image ID="imgDest" runat="server" CssClass="w-24 h-24 rounded-lg object-cover" />
                                                    <div>
                                                        <h4 class="text-xl font-bold heading-font">
                                                            <asp:Label ID="lblDestName" runat="server"></asp:Label></h4>
                                                        <p class="text-text-light">
                                                            <asp:Label ID="lblDuration" runat="server"></asp:Label>
                                                        </p>
                                                        <p class="font-semibold text-lg text-midnight-green">
                                                            <asp:Label ID="lblPricePerPerson" runat="server"></asp:Label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="border-t my-6"></div>

                                                <div class="space-y-2 text-base">
                                                    <%-- NEW LABELS ADDED HERE --%>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-user-circle text-xl"></i>Booking For</span>
                                                        <asp:Label ID="lblBookingForName" runat="server" Text="Self" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-utensils text-xl"></i>Meal Preference</span>
                                                        <asp:Label ID="lblMealPreferenceName" runat="server" Text="Any" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-bed text-xl"></i>Room Type</span>
                                                        <asp:Label ID="lblRoomSelectionName" runat="server" Text="Standard Room" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <%-- END NEW LABELS --%>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-user-friends text-xl"></i>Travelers</span>
                                                        <asp:Label ID="lblTravelerSummary" runat="server" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-money-bill-wave text-xl"></i>Base Price</span>
                                                        <asp:Label ID="lblBasePriceSummary" runat="server" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-concierge-bell"></i>Room Upgrade Cost</span>
                                                        <asp:Label ID="lblRoomUpgradeSummary" runat="server" Text="₹0" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-utensils"></i>Meal Upgrade Cost</span>
                                                        <asp:Label ID="lblMealUpgradeSummary" runat="server" Text="₹0" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-shield-alt text-xl"></i>Insurance</span>
                                                        <asp:Label ID="lblInsuranceSummary" runat="server" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-item">
                                                        <span class="summary-item-label"><i class="las la-tag text-xl"></i>Taxes & Fees</span>
                                                        <asp:Label ID="lblTaxesSummary" runat="server" CssClass="summary-item-value"></asp:Label>
                                                    </div>
                                                    <div class="summary-total">
                                                        <span>Total</span>
                                                        <asp:Label ID="lblTotalSummary" runat="server"></asp:Label>
                                                    </div>
                                                </div>

                                                <div class="mt-8">
                                                    <asp:Button ID="btnConfirmBooking" runat="server" Text="Confirm & Proceed" OnClick="btnConfirmBooking_Click" CssClass="w-full py-4 rounded-full text-white text-xl font-bold confirm-btn" />
                                                </div>
                                                <p class="text-xs text-center mt-4 text-text-light">By proceeding, you agree to our Terms and Conditions.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </section>
        </main>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">
        // Global options for Razorpay (set by C# on success)
        var razorpayOptions = {};

        // Function to launch the Razorpay modal
        function launchRazorpay(options) {
            razorpayOptions = options;
            var rzp = new Razorpay(razorpayOptions);
            rzp.on('payment.failed', function (response) {
                // In a real application, you'd send this failure to the server
                console.error("Payment failed: ", response.error);
                alert('Payment failed. Please try again. Error: ' + response.error.description);
                // Optionally redirect to a failure page: window.location.href = 'PaymentFailure.aspx';
            });
            rzp.open();
        }

        // Standard ASP.NET AJAX event handling
        function pageLoaded() {
            if (typeof AOS !== 'undefined') {
                AOS.init({ once: true });
                AOS.refresh();
            }
        }

        if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);
        }

        document.addEventListener('DOMContentLoaded', function () {
            if (typeof AOS !== 'undefined') {
                AOS.init({ once: true });
            }
        });
    </script>
</asp:Content>