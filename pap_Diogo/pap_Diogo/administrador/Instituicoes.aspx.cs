using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.administrador
{
    public partial class Instituicoes : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridInsituições_SelectedIndexChanged(object sender, EventArgs e)
        {
            string inst_id = GridInsituições.SelectedRow.Cells[1].Text;

            var q = (from u in context.Instituiçao
                     join c in context.Concelhoes on u.Concelho equals c.ID
                     join d in context.Distritoes on c.Distrito equals d.ID
                     where u.ID_Instituiçao == inst_id
                     select new
                     {
                         u.Nome,
                         u.Morada,
                         u.Localidade,
                         u.Código_Postal,
                         u.Telefone,
                         u.Telemóvel,
                         u.Email,
                         u.URL,
                         u.C3_Words,
                         u.Data_de_registo,
                         Concelho = c.Nome,
                         Distrito = d.Nome
                     }).FirstOrDefault();


            textNome.Text = q.Nome;
            textMorada.Text = q.Morada;
            textLocalidade.Text = q.Localidade;
            textCodigoPostal.Text = q.Código_Postal;
            textTelefone.Text = q.Telefone;
            textTelemovel.Text = q.Telemóvel;
            textEmail.Text = q.Email;
            textURL.Text = q.URL;
            text3Words.Text = q.C3_Words;
            textData.Text = DateTime.Parse(q.Data_de_registo.ToString()).ToShortDateString();
            textDistrito.Text = q.Distrito;
            textConcelho.Text = q.Concelho;            
        }

        protected void GridInsituições_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Control c = e.Row.Cells[5].FindControl("Image2");
                MembershipUser user = Membership.GetUser(e.Row.Cells[4].Text);
                if(c != null)
                {
                    System.Web.UI.WebControls.Image i = (System.Web.UI.WebControls.Image)c;
                    if (user.IsApproved == false)
                        i.ImageUrl = "/png images/warning.png";
                    else
                        i.ImageUrl = "/png images/check green.png";
                }
                
            }

            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            { 
                e.Row.Cells[1].Visible = false; 
                e.Row.Cells[4].Visible = false; 
            
            }
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(GridInsituições.SelectedRow.Cells[4].Text);
            if (user.IsApproved)
            {
                user.IsApproved = false;
                Membership.UpdateUser(user);

                //enviar email a avisar a instituição
                string inst_id = GridInsituições.SelectedRow.Cells[1].Text;
                var email = context.Instituiçao.Where(i => i.ID_Instituiçao == inst_id).SingleOrDefault();
                string para = email.Email;
                string de = "AdocaoAd123123@hotmail.com";
                string pass = "Adocao123123";
                string assunto = "Instituição Removida";
                string mensagem = "A sua instituição foi Removida.";
                EnviarEmail(para, de, pass, assunto, mensagem);
                GridInsituições.DataBind();

            }
        }

        protected void btnAprovar_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(GridInsituições.SelectedRow.Cells[4].Text);
            if (user.IsApproved == false)
            {
                user.IsApproved = true;
                Membership.UpdateUser(user);

                //enviar email a avisar a instituição
                string inst_id = GridInsituições.SelectedRow.Cells[1].Text;
                var email = context.Instituiçao.Where(i => i.ID_Instituiçao == inst_id).SingleOrDefault();
                string para = email.Email;
                string de = "AdocaoAd123123@hotmail.com";
                string pass = "Adocao123123";
                string assunto = "Instituição aceite";
                string mensagem = "A sua instituição foi aprovada. já pode fazer login em: http://localhost:50728/login.aspx";
                EnviarEmail(para, de, pass, assunto, mensagem);
                GridInsituições.DataBind();
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