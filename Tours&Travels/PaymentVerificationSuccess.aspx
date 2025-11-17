<%@ Page Title="Payment Status" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentVerification&Success.aspx.cs" Inherits="Tours_Travels.PaymentVerification_Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>

    body {
        background: linear-gradient(135deg, #0b6e4f 0%, #073b3a 100%);
        background-attachment: fixed;
    }

    .payment-container {
        max-width: 700px;
        margin: 80px auto;
        background: #ffffffee;
        backdrop-filter: blur(6px);
        border-radius: 20px;
        padding: 50px 45px;
        box-shadow: 0px 20px 60px rgba(0,0,0,0.25);
        text-align: center;
        font-family: "Segoe UI", sans-serif;
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .success-icon, .failed-icon {
        font-size: 80px;
        padding: 20px;
        border-radius: 50%;
        display: inline-block;
        margin-bottom: 15px;
        animation: zoom 0.6s ease-in-out;
    }

    .success-icon {
        color: #0b6e4f;
        background: #d1fae5;
        box-shadow: 0 0 18px #34d399aa;
    }

    .failed-icon {
        color: #e11d48;
        background: #ffe4e6;
        box-shadow: 0 0 18px #fb7185aa;
    }

    @keyframes zoom {
        from { transform: scale(0.6); opacity: 0; }
        to { transform: scale(1); opacity: 1; }
    }

    .payment-container h2 {
        font-size: 32px;
        font-weight: 700;
        color: #073b3a;
        margin-bottom: 10px;
    }

    .payment-container p {
        font-size: 18px;
        color: #3b3b3b;
    }

    .details-box {
        margin-top: 30px;
        padding: 25px;
        background: #f1f5f9;
        border-radius: 16px;
        border: 1px solid #e2e8f0;
        text-align: left;
        font-size: 17px;
        line-height: 1.6;
        box-shadow: inset 0 0 12px rgba(0,0,0,0.05);
    }

    .details-box p {
        margin: 10px 0;
        display: flex;
        justify-content: space-between;
        font-size: 17px;
        color: #073b3a;
    }

    .label-text {
        font-weight: 600;
        color: #0b6e4f;
    }

    .btn-back {
        margin-top: 30px;
        display: inline-block;
        padding: 14px 32px;
        border-radius: 35px;
        text-decoration: none;
        font-size: 18px;
        font-weight: 600;
        color: #fff;
        background: linear-gradient(135deg, #0b6e4f, #064f38);
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
        transition: 0.35s ease;
        letter-spacing: 0.5px;
    }

    .btn-back:hover {
        background: linear-gradient(135deg, #064f38, #073b3a);
        transform: translateY(-3px);
        box-shadow: 0 12px 26px rgba(0, 0, 0, 0.25);
    }

    .info-note {
        background: #fff7ed;
        padding: 12px;
        border-left: 5px solid #f59e0b;
        border-radius: 6px;
        margin-top: 20px;
        color: #7c5200;
        font-size: 15px;
        text-align: left;
    }

</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="payment-container">

    <!-- SUCCESS PANEL -->
    <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
        <i class="fa-solid fa-circle-check success-icon"></i>

        <h2>Payment Successful!</h2>
        <p>Your booking is now confirmed. You will receive an email shortly.</p>

        <div class="details-box">
            <p><span class="label-text">Payment ID:</span> <asp:Label ID="lblPaymentId" runat="server" /></p>
            <p><span class="label-text">Order ID:</span> <asp:Label ID="lblOrderId" runat="server" /></p>
            <p><span class="label-text">Booking ID:</span> <asp:Label ID="lblBookingId" runat="server" /></p>
            <p><span class="label-text">Amount Paid:</span> ₹<asp:Label ID="lblAmount" runat="server" /></p>
        </div>

        <div class="info-note">
            <strong>Note:</strong> Your e-ticket and invoice will be emailed within 5 minutes.
        </div>

        <a href="MyBookings.aspx" class="btn-back">View My Bookings</a>
    </asp:Panel>


    <!-- FAILED PANEL -->
    <asp:Panel ID="pnlFailed" runat="server" Visible="false">
        <i class="fa-solid fa-circle-xmark failed-icon"></i>

        <h2>Payment Failed</h2>
        <p>We could not verify your payment. Please try again or use another payment method.</p>

        <div class="details-box">
            <p><span class="label-text">Error:</span> <asp:Label ID="lblError" runat="server" /></p>
        </div>

        <div class="info-note">
            If the amount was deducted, Razorpay processes auto-refund within 5–7 working days.
        </div>

        <a href="Destination.aspx" class="btn-back">Back to Destinations</a>
    </asp:Panel>

</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/js/all.min.js"></script>
</asp:Content>
