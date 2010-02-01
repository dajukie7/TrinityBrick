using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mail;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MailMessage=System.Web.Mail.MailMessage;
using MailPriority=System.Net.Mail.MailPriority;

namespace TrinityBrick.Controllers
{
    public class ContactController : Controller
    {
        //
        // GET: /Contact/

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Index(string name)
        {
//            SendMail("smtp.gmail.com",587,"dajukie7@gmail.com","6403astbous3","Your name","dajukie7@gmail.com",
//                "Stefan Receiver","dajukie7@gmail.com","Test","Hello there Steff!",true);

//            SendMail();

            sendMail("dajukie7@gmail.com", "dajukie7@gmail.com", "", "", "Test Email", "This was a test");

            return Success();
        }

        public ActionResult Success()
        {
            return View("Success");
        }


        public static void SendMail(string sHost, int nPort, string sUserName, string sPassword, string sFromName, string sFromEmail,
        string sToName, string sToEmail, string sHeader, string sMessage, bool fSSL)
        {
            if (sToName.Length == 0)
                sToName = sToEmail;
            if (sFromName.Length == 0)
                sFromName = sFromEmail;

            MailMessage Mail = new MailMessage();
            Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserver"] = sHost;
            Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusing"] = 2;

            Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserverport"] = nPort.ToString();
            if (fSSL)
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpusessl"] = "true";

            if (sUserName.Length == 0)
            {
                //Ingen auth 
            }
            else
            {
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = sUserName;
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = sPassword;
            }

            if (fSSL)
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpusessl"] = "true";  

            Mail.To = sToEmail;
            Mail.From = sFromEmail;
            Mail.Subject = sHeader;
            Mail.Body = sMessage;
            Mail.BodyFormat = System.Web.Mail.MailFormat.Html;

            System.Web.Mail.SmtpMail.SmtpServer = sHost;
            System.Web.Mail.SmtpMail.Send(Mail);
        } 

        public static void SendMail()
        {
            System.Net.Mail.MailMessage MyMailMessage = new System.Net.Mail.MailMessage();
            MyMailMessage.From = new MailAddress("dajukie7@gmail.com");
            MyMailMessage.To.Add("dajukie7@gmail.com");
            MyMailMessage.Subject = "Feedback Form";
            MyMailMessage.IsBodyHtml = true;

            MyMailMessage.Body = "<table><tr><td>" + "scott" + "</table></tr></td>";

            SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");
            SMTPServer.Port = 587;
            SMTPServer.Credentials = new System.Net.NetworkCredential("dajukie7@gmail.com", "640eastbout3");
            SMTPServer.EnableSsl = true;
            try
            {
                SMTPServer.Send(MyMailMessage);
            }
            catch (Exception ex)
            {


            }
        }

        //This is fully working tested code. Copy and paste the code
        //Edit some parts(UserName, password) and ENJOY!
        public string sendMail(string from, string to, string cc, string bcc, string subject, string body)
        {
            // Mail initialization
            MailMessage mailMsg = new MailMessage();
            mailMsg.From = from;
            mailMsg.To = to;
            mailMsg.Cc = cc;
            mailMsg.Bcc = bcc;
            mailMsg.Subject = subject;
            mailMsg.BodyFormat = MailFormat.Text;
            mailMsg.Body = body;
            // Smtp configuration
            SmtpMail.SmtpServer = "smtp.gmail.com";
            // - smtp.gmail.com use smtp authentication
            mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "dajukie7@gmail.com");
            mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "6403astbous3");
            // - smtp.gmail.com use port 465 or 587
            mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
            // - smtp.gmail.com use STARTTLS (some call this SSL)
            mailMsg.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
            // try to send Mail
            try
            {
                SmtpMail.Send(mailMsg);
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        } 
    }
}
