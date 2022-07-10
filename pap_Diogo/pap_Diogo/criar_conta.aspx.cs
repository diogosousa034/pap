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
    public partial class criar_conta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkCriarConta_Click(object sender, EventArgs e)
        {
            //1 - criar conta - Membership
            Membership.CreateUser(textUsername.Text, textPassword.Text, textEmail.Text);

            //obter o UserID
            MembershipUser user = Membership.GetUser(textUsername.Text);
            //
            string user_id = user.ProviderUserKey.ToString();

            //2 - adicionar utilizador ao grupo correspondente
            if (rbUtilizador.Checked)
                Roles.AddUserToRole(textUsername.Text, "utilizador");
            else if(rbInstituicao.Checked)
            {
                Roles.AddUserToRole(textUsername.Text, "instituicao");
                user.IsApproved = false;
                Membership.UpdateUser(user);

                string para = "AdocaoAd123123@hotmail.com";
                string de = "AdocaoAd123123@hotmail.com";
                string pass = "Adocao123123";
                string assunto = "Uma nova instituição se registou!";
                string mensagem = "A instituição " + textUsername.Text + " se registou na plataforma e aguarda aprovação.";
                EnviarEmail(para, de, pass, assunto, mensagem);
            }
            //3 - criar utilizador (contexto projectos)
            pap_DiogoEntities db = new pap_DiogoEntities();

            if (rbUtilizador.Checked)
            {
                Utilizador utilizador = new Utilizador();
                utilizador.Nome = textNome.Text;
                utilizador.Email = textEmail.Text;
                utilizador.Data_de_registo = DateTime.Now;
                utilizador.ID_Utilizador = user_id;
                utilizador.Concelho = int.Parse(DropDownConcelho.SelectedValue);


                db.Utilizadors.Add(utilizador);
            }
            else if (rbInstituicao.Checked)
            {
                Instituiçao instituiçao = new Instituiçao();
                instituiçao.Nome = textNome.Text;
                instituiçao.Email = textEmail.Text;
                instituiçao.Data_de_registo = DateTime.Now;
                instituiçao.ID_Instituiçao = user_id;
                instituiçao.Concelho = int.Parse(DropDownConcelho.SelectedValue);

                db.Instituiçao.Add(instituiçao);
            }

            db.SaveChanges();

            Response.Redirect("login.aspx");
        }

        void EnviarEmail(string para, string de, string pass, string assunto, string mensagem)
        {
            using (MailMessage mm = new MailMessage(de, para))
            {
                mm.Subject = assunto;
                mm.Body = mensagem;
                //considerando a possibilidade de existirem anexos

                //if (fupl_anexo.HasFile)
                //{
                //    string FileName = Path.GetFileName(fupl_anexo.PostedFile.FileName);
                //    mm.Attachments.Add(new Attachment(fupl_anexo.PostedFile.InputStream, FileName));
                //}

                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp-mail.outlook.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(de, pass);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email enviado.');", true);
                //MessageBox.Show("Enviado com sucesso");
            }
        }
    }
}