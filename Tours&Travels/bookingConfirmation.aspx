<%@ Page Title="Booking Confirmation" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookingConfirmation.aspx.cs" Inherits="Tours_Travels.bookingConfirmation" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    </style>
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
                                <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 items-start">
                                    <div class="lg:col-span-2 bg-white p-8 rounded-lg shadow-xl">
                                        <div>
                                            <h2 class="text-3xl font-bold heading-font mb-8 text-midnight-green">Traveler Information</h2>
                                            <!-- Message Label -->
                                            <asp:Label ID="lblMessage" runat="server"
                                                CssClass="block text-center text-sm font-semibold mb-2"
                                                ForeColor="Red">
                                            </asp:Label>
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

                                                <%-- ==== START: UPDATED PHONE & DATE FIELDS ==== --%>
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
                                                <%-- ==== END: UPDATED PHONE & DATE FIELDS ==== --%>

                                                <div class="md:col-span-2 mt-4">
                                                    <h3 class="font-semibold text-text-light mb-2">Number of Travelers</h3>
                                                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 bg-gray-50 p-4 rounded-md border">
                                                        <div>
                                                            <label class="font-semibold text-text-dark">Adults</label>
                                                            <div class="flex items-center gap-4 mt-1">
                                                                <asp:Button ID="btnAdultsDecrement" runat="server" Text="-" OnClick="Quantity_Click" CommandArgument="Adults_Decrement" CssClass="quantity-btn" />
                                                                <asp:Label ID="lblAdultsCount" runat="server" Text="1" CssClass="font-bold text-lg w-8 text-center"></asp:Label>
                                                                <asp:Button ID="btnAdultsIncrement" runat="server" Text="+" OnClick="Quantity_Click" CommandArgument="Adults_Increment" CssClass="quantity-btn" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <label class="font-semibold text-text-dark">Children</label>
                                                            <div class="flex items-center gap-4 mt-1">
                                                                <asp:Button ID="btnChildrenDecrement" runat="server" Text="-" OnClick="Quantity_Click" CommandArgument="Children_Decrement" CssClass="quantity-btn" />
                                                                <asp:Label ID="lblChildrenCount" runat="server" Text="0" CssClass="font-bold text-lg w-8 text-center"></asp:Label>
                                                                <asp:Button ID="btnChildrenIncrement" runat="server" Text="+" OnClick="Quantity_Click" CommandArgument="Children_Increment" CssClass="quantity-btn" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="lg:col-span-1">
                                        <div class="bg-white rounded-lg shadow-xl p-6 sticky top-28 border-t-4 border-t-dartmouth-green">
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
                                            <div class="space-y-3 text-lg">
                                                <asp:Label ID="lblSummaryDetails" runat="server"></asp:Label>
                                            </div>
                                            <div class="mt-6">
                                                <asp:Button ID="btnConfirmBooking" runat="server" Text="Confirm Booking" OnClick="btnConfirmBooking_Click" CssClass="w-full py-4 rounded-full text-white text-xl font-bold confirm-btn" />
                                            </div>
                                            <p class="text-xs text-center mt-4 text-text-light">By proceeding, you agree to our Terms and Conditions.</p>
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
        function pageLoaded() {
            if (typeof AOS !== 'undefined') {
                AOS.refresh();
            }
        }

        if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);
        }
    </script>
</asp:Content>
