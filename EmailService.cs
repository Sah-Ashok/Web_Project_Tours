using System;
using System.Net;
using System.Net.Mail;

namespace Web_Project_Tours
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
                message.From = new MailAddress("wd0ashok@gmail.com", "Travel & Tours");
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
