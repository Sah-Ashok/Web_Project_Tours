using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using Razorpay.Api;

namespace Tours_Travels.Services
{
    public class RazorpayService
    {
        private readonly RazorpayClient _client;
        private readonly string _secret;

        public RazorpayService(string key, string secret)
        {
            _client = new RazorpayClient(key, secret);
            _secret = secret;
        }

        public Order CreateOrder(int amountInRupees)
        {
            var options = new Dictionary<string, object>
            {
                { "amount", amountInRupees },
                { "currency", "INR" },
                { "receipt", "rcpt_" + Guid.NewGuid().ToString("N").Substring(0, 10) },
                { "payment_capture", 1 }
            };
            return _client.Order.Create(options);
        }

        public bool VerifySignature(string orderId, string paymentId, string signature)
        {
            try
            {
                string payload = orderId + "|" + paymentId;

                using (var hmac = new System.Security.Cryptography.HMACSHA256(
                       System.Text.Encoding.UTF8.GetBytes(_secret)))
                {
                    var hash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(payload));
                    string generatedSignature = BitConverter.ToString(hash).Replace("-", "").ToLower();

                    return generatedSignature == signature;
                }
            }
            catch
            {
                return false;
            }
        }


        public Refund RefundPayment(string paymentId, int amountInRupees)
        {
            var payment = _client.Payment.Fetch(paymentId);
            var refundOptions = new Dictionary<string, object>
            {
                { "amount", amountInRupees * 100 }
            };
            return payment.Refund(refundOptions);
        }
    }
}
