using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.administrador
{
    public partial class Utilizadores : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridUtilizadores_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[5].Visible = false;
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Control c = e.Row.Cells[6].FindControl("Image2");

                string username = e.Row.Cells[5].Text;
                MembershipUser user = Membership.GetUser(username);

                if (c != null)
                {
                    System.Web.UI.WebControls.Image i = (System.Web.UI.WebControls.Image)c;
                    if (user.IsApproved)
                        i.ImageUrl = "/png images/check green.png";
                    else
                        i.ImageUrl = "/png images/warning.png";
                }
            }
        }

        protected void GridUtilizadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            string user_id = GridUtilizadores.SelectedRow.Cells[1].Text;

            var q = (from u in context.Utilizadors
                     join c in context.Concelhoes on u.Concelho equals c.ID
                     join d in context.Distritoes on c.Distrito equals d.ID
                     where u.ID_Utilizador == user_id
                     select new
                     {
                         u.Nome,
                         u.Email,
                         u.Telefone,
                         u.Data_de_registo,
                         Concelho = c.Nome,
                         Distrito = d.Nome
                     }).FirstOrDefault();


            textNome.Text = q.Nome;
            textEmail.Text = q.Email;
            textNumero.Text = q.Telefone;
            textData.Text = DateTime.Parse(q.Data_de_registo.ToString()).ToShortDateString();
            textDistrito.Text = q.Distrito;
            textConcelho.Text = q.Concelho;
        }

        protected void btnAtivar_Click(object sender, EventArgs e)
        {
            string username = GridUtilizadores.SelectedRow.Cells[5].Text;
            string userid = GridUtilizadores.SelectedRow.Cells[1].Text;
            var usermail = context.Utilizadors.Where(x => x.ID_Utilizador == userid).FirstOrDefault();
            MembershipUser user = Membership.GetUser(username);
            if (user.IsApproved == false)
            {
                user.IsApproved = true;
                Membership.UpdateUser(user);

                string para = usermail.Email;
                string de = "AdocaoAd123123@hotmail.com";
                string pass = "Adocao123123";
                string assunto = "A sua conta foi ativada novamente!";
                string mensagem = "A sua conta foi Ativada.";
                EnviarEmail(para, de, pass, assunto, mensagem);
            }
        }

        protected void btnDesativar_Click(object sender, EventArgs e)
        {
            string username = GridUtilizadores.SelectedRow.Cells[5].Text;
            string userid = GridUtilizadores.SelectedRow.Cells[1].Text;
            var usermail = context.Utilizadors.Where(x => x.ID_Utilizador == userid).FirstOrDefault();
            MembershipUser user = Membership.GetUser(username);
            if (user.IsApproved)
            {
                user.IsApproved = false;
                Membership.UpdateUser(user);

                string para = usermail.Email;
                string de = "AdocaoAd123123@hotmail.com";
                string pass = "Adocao123123";
                string assunto = "A sua conta foi desativada!";
                string mensagem = "A sua conta foi desativada.";
                EnviarEmail(para, de, pass, assunto, mensagem);
            }
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