using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;

namespace Tours_Travels
{
    public class EmailService
    {
        public bool SendEmail(string toEmail, string subject, string body)
        {
            try
            {

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("wd0ashok@gmail.com", "ypoo zovg bqyn yslc");
                smtp.EnableSsl = true;
                MailMessage message = new MailMessage();
                message.From = new MailAddress("wd0ashok@gmail.com", "Exploria Tours&Travels");
                message.To.Add(toEmail);
                message.Subject = subject;
                message.Body = body;
                message.IsBodyHtml = true;
                smtp.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error sending email: " + ex.Message);
                return false;
            }
        }
    }
}