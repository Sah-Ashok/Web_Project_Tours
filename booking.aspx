<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="Web_Project_Tours.booking" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="main">

        <!-- Page Title -->
        <div class="page-title dark-background" data-aos="fade" style="background-image: url(assets/img/travel/showcase-8.png);">
            <div class="container position-relative">
                <h1>Booking</h1>
                <p>Esse dolorum voluptatum ullam est sint nemo et est ipsa porro placeat quibusdam quia assumenda numquam molestias.</p>
                <nav class="breadcrumbs">
                    <ol>
                        <li><a href="index.aspx">Home</a></li>
                        <li class="current">Booking</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- End Page Title -->

        <!-- Travel Booking Section -->
        <section id="travel-booking" class="travel-booking section">
            <div class="container" data-aos="fade-up" data-aos-delay="100">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="booking-form-container">
                            <!-- Progress Steps -->
                            <div class="booking-progress nav nav-tabs" data-aos="fade-up" data-aos-delay="200">
                                <button class="step nav-link active" data-bs-toggle="tab" data-bs-target="#travel-booking-step-1" aria-current="page">
                                    <span class="step-number">1</span>
                                    <span class="step-title">Tour &amp; Dates</span>
                                </button>
                                <button class="step nav-link" data-bs-toggle="tab" data-bs-target="#travel-booking-step-2">
                                    <span class="step-number">2</span>
                                    <span class="step-title">Travelers</span>
                                </button>
                                <button class="step nav-link" data-bs-toggle="tab" data-bs-target="#travel-booking-step-3">
                                    <span class="step-number">3</span>
                                    <span class="step-title">Add-ons</span>
                                </button>
                                <button class="step nav-link" data-bs-toggle="tab" data-bs-target="#travel-booking-step-4">
                                    <span class="step-number">4</span>
                                    <span class="step-title">Payment</span>
                                </button>
                            </div>
                            <!-- End Progress Steps -->

                            <!-- Booking Form -->
                            <asp:Panel ID="BookingForm" runat="server" CssClass="booking-form" data-aos="fade-up" data-aos-delay="300">
                                <div class="tab-content" id="bookingTabContent">
                                    <!-- Step 1: Tour & Dates -->
                                    <div class="form-step tab-pane fade show active" id="travel-booking-step-1" role="tabpanel">
                                        <h4>Select Your Tour &amp; Travel Dates</h4>
                                        <div class="row gy-4">
                                            <div class="col-md-6">
                                                <label for="tour-select">Choose Tour Package</label>
                                                <asp:DropDownList ID="tour_select" runat="server" CssClass="form-select" Required="true">
                                                    <asp:ListItem Value="">Select a tour...</asp:ListItem>
                                                    <asp:ListItem Value="amazing-bali-adventure">Amazing Bali Adventure - 7 Days</asp:ListItem>
                                                    <asp:ListItem Value="thailand-explorer">Thailand Explorer - 10 Days</asp:ListItem>
                                                    <asp:ListItem Value="vietnam-highlights">Vietnam Highlights - 8 Days</asp:ListItem>
                                                    <asp:ListItem Value="cambodia-discovery">Cambodia Discovery - 6 Days</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="tour-duration">Duration</label>
                                                <asp:TextBox ID="tour_duration" runat="server" CssClass="form-control" Text="7 Days / 6 Nights" ReadOnly="true"></asp:TextBox>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="departure-date">Departure Date</label>
                                                <asp:TextBox ID="departure_date" runat="server" CssClass="form-control" TextMode="Date" Required="true"></asp:TextBox>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="return-date">Return Date</label>
                                                <asp:TextBox ID="return_date" runat="server" CssClass="form-control" TextMode="Date" Required="true"></asp:TextBox>
                                            </div>

                                            <div class="col-md-4">
                                                <label for="adults">Adults</label>
                                                <asp:DropDownList ID="adults" runat="server" CssClass="form-select" Required="true">
                                                    <asp:ListItem Value="1">1 Adult</asp:ListItem>
                                                    <asp:ListItem Value="2">2 Adults</asp:ListItem>
                                                    <asp:ListItem Value="3">3 Adults</asp:ListItem>
                                                    <asp:ListItem Value="4">4 Adults</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class="col-md-4">
                                                <label for="children">Children (2-12)</label>
                                                <asp:DropDownList ID="children" runat="server" CssClass="form-select">
                                                    <asp:ListItem Value="0">0 Children</asp:ListItem>
                                                    <asp:ListItem Value="1">1 Child</asp:ListItem>
                                                    <asp:ListItem Value="2">2 Children</asp:ListItem>
                                                    <asp:ListItem Value="3">3 Children</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class="col-md-4">
                                                <label for="infants">Infants (0-2)</label>
                                                <asp:DropDownList ID="infants" runat="server" CssClass="form-select">
                                                    <asp:ListItem Value="0">0 Infants</asp:ListItem>
                                                    <asp:ListItem Value="1">1 Infant</asp:ListItem>
                                                    <asp:ListItem Value="2">2 Infants</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Step 1 -->

                                    <!-- Step 2: Traveler Information -->
                                    <div class="form-step tab-pane fade" id="travel-booking-step-2" role="tabpanel">
                                        <h4>Traveler Information</h4>
                                        <div class="traveler-info">
                                            <h5>Lead Traveler</h5>
                                            <div class="row gy-3">
                                                <div class="col-md-6">
                                                    <label for="first-name">First Name</label>
                                                    <asp:TextBox ID="first_name" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="last-name">Last Name</label>
                                                    <asp:TextBox ID="last_name" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="email">Email Address</label>
                                                    <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" Required="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="phone">Phone Number</label>
                                                    <asp:TextBox ID="phone" runat="server" CssClass="form-control" TextMode="Phone" Required="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="nationality">Nationality</label>
                                                    <asp:DropDownList ID="nationality" runat="server" CssClass="form-select" Required="true">
                                                        <asp:ListItem Value="">Select nationality...</asp:ListItem>
                                                        <asp:ListItem Value="US">United States</asp:ListItem>
                                                        <asp:ListItem Value="CA">Canada</asp:ListItem>
                                                        <asp:ListItem Value="UK">United Kingdom</asp:ListItem>
                                                        <asp:ListItem Value="AU">Australia</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="special-requirements">
                                            <h5>Special Requirements</h5>
                                            <div class="row gy-3">
                                                <div class="col-12">
                                                    <label for="dietary">Dietary Restrictions</label>
                                                    <asp:TextBox ID="dietary" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" PlaceHolder="Please mention any dietary restrictions or food allergies..."></asp:TextBox>
                                                </div>
                                                <div class="col-12">
                                                    <label for="special-requests">Special Requests</label>
                                                    <asp:TextBox ID="special_requests" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" PlaceHolder="Any special requests or accessibility needs..."></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Step 2 -->

                                    <!-- Step 3: Add-ons & Extras -->
                                    <div class="form-step tab-pane fade" id="travel-booking-step-3" role="tabpanel">
                                        <h4>Enhance Your Experience</h4>
                                        <div class="addon-options">
                                            <div class="addon-item">
                                                <div class="addon-details">
                                                    <div class="addon-check">
                                                        <asp:CheckBox ID="travel_insurance" runat="server" />
                                                        <label for="travel_insurance">
                                                            <h5>Travel Insurance</h5>
                                                            <p>Comprehensive coverage for your trip including medical emergencies and cancellations.</p>
                                                        </label>
                                                    </div>
                                                    <div class="addon-price">
                                                        <span class="price">$89</span>
                                                        <span class="period">per person</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="addon-item">
                                                <div class="addon-details">
                                                    <div class="addon-check">
                                                        <asp:CheckBox ID="airport_transfer" runat="server" />
                                                        <label for="airport_transfer">
                                                            <h5>Airport Transfer</h5>
                                                            <p>Private pickup and drop-off service from/to the airport with comfortable vehicle.</p>
                                                        </label>
                                                    </div>
                                                    <div class="addon-price">
                                                        <span class="price">$45</span>
                                                        <span class="period">per trip</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="addon-item">
                                                <div class="addon-details">
                                                    <div class="addon-check">
                                                        <asp:CheckBox ID="extra_nights" runat="server" />
                                                        <label for="extra_nights">
                                                            <h5>Extra Hotel Nights</h5>
                                                            <p>Extend your stay with additional nights at premium hotels before or after your tour.</p>
                                                        </label>
                                                    </div>
                                                    <div class="addon-price">
                                                        <span class="price">$120</span>
                                                        <span class="period">per night</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="addon-item">
                                                <div class="addon-details">
                                                    <div class="addon-check">
                                                        <asp:CheckBox ID="local_guide" runat="server" />
                                                        <label for="local_guide">
                                                            <h5>Private Local Guide</h5>
                                                            <p>Personal guide for exclusive insights and customized exploration of hidden gems.</p>
                                                        </label>
                                                    </div>
                                                    <div class="addon-price">
                                                        <span class="price">$199</span>
                                                        <span class="period">per day</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Step 3 -->

                                    <!-- Step 4: Payment Information -->
                                    <div class="form-step tab-pane fade" id="travel-booking-step-4" role="tabpanel">
                                        <h4>Payment Information</h4>
                                        <div class="payment-methods">
                                            <div class="method-selector">
                                                <asp:RadioButton ID="credit_card" runat="server" GroupName="payment_method" Checked="true" />
                                                <label for="credit_card"><i class="bi bi-credit-card"></i>Credit Card</label>
                                            </div>
                                            <div class="method-selector">
                                                <asp:RadioButton ID="paypal" runat="server" GroupName="payment_method" />
                                                <label for="paypal"><i class="bi bi-paypal"></i>PayPal</label>
                                            </div>
                                            <div class="method-selector">
                                                <asp:RadioButton ID="bank_transfer" runat="server" GroupName="payment_method" />
                                                <label for="bank_transfer"><i class="bi bi-bank"></i>Bank Transfer</label>
                                            </div>
                                        </div>
                                        <div class="payment-details">
                                            <div class="row gy-3">
                                                <div class="col-12">
                                                    <label for="card-name">Cardholder Name</label>
                                                    <asp:TextBox ID="card_name" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-8">
                                                    <label for="card-number">Card Number</label>
                                                    <asp:TextBox ID="card_number" runat="server" CssClass="form-control" PlaceHolder="1234 5678 9012 3456" Required="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="card-cvv">CVV</label>
                                                    <asp:TextBox ID="card_cvv" runat="server" CssClass="form-control" PlaceHolder="123" Required="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="card-expiry-month">Expiry Month</label>
                                                    <asp:DropDownList ID="card_expiry_month" runat="server" CssClass="form-select" Required="true">
                                                        <asp:ListItem Value="">Month</asp:ListItem>
                                                        <asp:ListItem Value="01">01</asp:ListItem>
                                                        <asp:ListItem Value="02">02</asp:ListItem>
                                                        <asp:ListItem Value="03">03</asp:ListItem>
                                                        <asp:ListItem Value="04">04</asp:ListItem>
                                                        <asp:ListItem Value="05">05</asp:ListItem>
                                                        <asp:ListItem Value="06">06</asp:ListItem>
                                                        <asp:ListItem Value="07">07</asp:ListItem>
                                                        <asp:ListItem Value="08">08</asp:ListItem>
                                                        <asp:ListItem Value="09">09</asp:ListItem>
                                                        <asp:ListItem Value="10">10</asp:ListItem>
                                                        <asp:ListItem Value="11">11</asp:ListItem>
                                                        <asp:ListItem Value="12">12</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="card-expiry-year">Expiry Year</label>
                                                    <asp:DropDownList ID="card_expiry_year" runat="server" CssClass="form-select" Required="true">
                                                        <asp:ListItem Value="">Year</asp:ListItem>
                                                        <asp:ListItem Value="2024">2024</asp:ListItem>
                                                        <asp:ListItem Value="2025">2025</asp:ListItem>
                                                        <asp:ListItem Value="2026">2026</asp:ListItem>
                                                        <asp:ListItem Value="2027">2027</asp:ListItem>
                                                        <asp:ListItem Value="2028">2028</asp:ListItem>
                                                        <asp:ListItem Value="2029">2029</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="secure-payment">
                                                <i class="bi bi-shield-check"></i>
                                                <span>Your payment information is secure and encrypted</span>
                                            </div>
                                        </div>
                                        <div class="terms-agreement">
                                            <div class="form-check">
                                                <asp:CheckBox ID="terms_agreement" runat="server" CssClass="form-check-input" Required="true" />
                                                <label for="terms_agreement" class="form-check-label">
                                                    I agree to the <a href="#">Terms &amp; Conditions</a> and <a href="#">Privacy Policy</a>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-navigation">
                                            <asp:Button ID="btnCompleteBooking" runat="server" CssClass="btn btn-book" Text="Complete Booking" OnClick="btnCompleteBooking_Click" />
                                        </div>
                                    </div>
                                    <!-- End Step 4 -->
                                </div>
                                <!-- End Tab Content -->
                            </asp:Panel>
                            <!-- End Booking Form -->
                        </div>
                    </div>

                    <!-- Booking Summary Sidebar -->
                    <div class="col-lg-4">
                        <div class="booking-summary" data-aos="fade-up" data-aos-delay="400">
                            <div class="summary-header">
                                <h4>Booking Summary</h4>
                            </div>
                            <div class="selected-tour">
                                <asp:Image ID="imgTour" runat="server" CssClass="img-fluid" AlternateText="Selected Tour" />
                                <div class="tour-info">
                                    <h5>
                                        <asp:Label ID="lblTitle" runat="server" Text="Tour Title"></asp:Label></h5>
                                    <p><i class="bi bi-calendar"></i>
                                        <asp:Label ID="lblDuration" runat="server" Text="Duration"></asp:Label></p>
                                    <p><i class="bi bi-geo-alt"></i>
                                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label></p>
                                </div>
                            </div>
                            <div class="booking-details">
                                <div class="detail-item">
                                    <span class="label">Departure:</span>
                                    <span class="value">
                                        <asp:Label ID="lblDeparture" runat="server" Text="Select dates"></asp:Label></span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">Travelers:</span>
                                    <span class="value">
                                        <asp:Label ID="lblTravelers" runat="server" ></asp:Label></span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">Duration:</span>
                                    <span class="value">
                                        <asp:Label ID="lblDurationOnly" runat="server" Text="7 Days"></asp:Label></span>
                                </div>
                            </div>
                            <div class="price-breakdown">
                                <div class="price-item">
                                    <span class="description">Base Price (2 Adults)</span>
                                    <span class="amount">
                                        <asp:Label ID="lblBasePrice" runat="server" Text="₹1,899"></asp:Label></span>
                                </div>
                                <div class="price-item">
                                    <span class="description">Travel Insurance</span>
                                    <span class="amount">
                                        <asp:Label ID="lblTravelInsurance" runat="server" Text="₹178"></asp:Label></span>
                                </div>
                                <div class="price-item">
                                    <span class="description">Airport Transfer</span>
                                    <span class="amount">
                                        <asp:Label ID="lblAirportTransfer" runat="server" Text="₹90"></asp:Label></span>
                                </div>
                                <div class="price-item tax-item">
                                    <span class="description">Taxes &amp; Fees</span>
                                    <span class="amount">
                                        <asp:Label ID="lblTaxesFees" runat="server" Text="₹156"></asp:Label></span>
                                </div>
                                <div class="price-total">
                                    <span class="description">Total Amount</span>
                                    <span class="amount">
                                        <asp:Label ID="lblTotalAmount" runat="server" Text="₹2,323"></asp:Label></span>
                                </div>
                            </div>
                            <div class="help-section">
                                <h5>Need Help?</h5>
                                <p>Our travel experts are here to assist you</p>
                                <div class="contact-info">
                                    <p><i class="bi bi-telephone"></i>+1 (555) 123-4567</p>
                                    <p><i class="bi bi-envelope"></i>support@example.com</p>
                                </div>
                                <div class="support-hours">
                                    <small>Available 24/7</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /Travel Booking Section -->
    </main>
</asp:Content>
