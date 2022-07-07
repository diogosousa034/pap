using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo
{
    public partial class Recuperar_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonRecuperar_Click(object sender, EventArgs e)
        {
            string msg = string.Empty;
            // Obter dados do utilizador
            MembershipUser user = Membership.GetUser(textUsername.Text, false);
            // Alterar password
            string password = Membership.GeneratePassword(10, 2);
            user.ChangePassword(user.ResetPassword(), password);
            Membership.UpdateUser(user);
            // Enviar email
            string mensagem = string.Format(@"<html>
            <head>
            <title>Recuperação de Password</title>
            </head>
            <body>
            <h4>ASP.NET - gestão de utilizadores</h4><br /><br />
            <p>Recuperação de password</p><br /><br />

            <p>do utilizador {0}; a nova password é: {1}</p><br /><br />
            <p>Altere a sua password no próximo Login.</p><br /><br />

            </body>
            </html>", textUsername.Text, password);
            EnviarEmail(user.Email, "Recuperação de Password", mensagem);
            Response.Redirect("login.aspx");
        }

        void EnviarEmail(string para, string assunto, string mensagem)
        {
            using (MailMessage mm = new MailMessage("AdocaoAd123123@hotmail.com", para))
            {
                mm.Subject = assunto;
                mm.Body = mensagem;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp-mail.outlook.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new
                NetworkCredential("AdocaoAd123123@hotmail.com", "Adocao123123");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 25;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(),
                "alert", "alert('Email enviado.');", true);
            }
        }
    }
}