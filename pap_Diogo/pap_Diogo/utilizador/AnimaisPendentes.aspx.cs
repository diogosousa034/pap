using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.utilizador
{
    public partial class AnimaisPendentes : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridAnimais_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {
               e.Row.Cells[1].Visible = false;
               e.Row.Cells[7].Visible = false;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Control c = e.Row.Cells[8].FindControl("Image2");

                int id_animal = int.Parse(e.Row.Cells[1].Text);
                int total = (from ua in context.Utilizador_Animal where ua.Animal == id_animal select ua).Count();
                
                int id = int.Parse(e.Row.Cells[1].Text);
                var q = (from a in context.Animals where a.ID_animal == id select new { a.Utilizador }).SingleOrDefault();

                if (c != null)
                {
                    System.Web.UI.WebControls.Image i = (System.Web.UI.WebControls.Image)c;
                    if (q.Utilizador != null)
                        i.ImageUrl = "/png images/warning.png";
                    else
                        i.ImageUrl = "/png images/transparent.png";

                }
                                          

            }
        }

        protected void GridAnimais_SelectedIndexChanged(object sender, EventArgs e)
        {
             
            int animalid = int.Parse(GridAnimais.SelectedRow.Cells[1].Text);
            if (animalid > 0)
            {
                var q = (from a in context.Animals
                         join c in context.Concelhoes on a.Concelho equals c.ID
                         join d in context.Distritoes on c.Distrito equals d.ID
                         join r in context.Raça on a.Raça equals r.ID_Raça
                         join t in context.Tipoes on r.Tipo equals t.ID_Tipo
                         where a.ID_animal == animalid
                         select new
                         {
                             a.Nome,
                             a.Género,
                             a.Idade,
                             a.Porte,
                             a.Características,
                             a.Desparazitado,
                             a.Vacinas,
                             a.Descriçao,
                             a.Foto,
                             a.Cor,
                             a.Esterilizado,
                             Concelho = c.Nome,
                             Distrito = d.Nome,
                             Raça = r.Nome,
                             Tipo = t.Nome
                         }).SingleOrDefault();

                textNomeAnimal.Text = q.Nome;
                textGénero.Text = q.Género;
                textIdade.Text = q.Idade;
                textPorte.Text = q.Porte;

                textCaracteristicas.Text = q.Características;
                textTipo.Text = q.Tipo;
                textRaça.Text = q.Raça;
                textConcelho.Text = q.Concelho;
                textCor.Text = q.Cor;

                CheckDesparazitado.Checked = (bool)q.Desparazitado;

                textVacinas.Text = q.Vacinas;

                CheckEsterelizado.Checked = (bool)q.Esterilizado;


                textDescricao.Text = q.Descriçao;

                AnimalImageView.ImageUrl = q.Foto;

            }
        }

        protected void btnAceitar_Click(object sender, EventArgs e)
        {
            int animalid = int.Parse(GridAnimais.SelectedRow.Cells[1].Text);
            string userid = Session["User"].ToString();
            var animal = context.Animals.Where(a => a.ID_animal == animalid).SingleOrDefault();
            var utilizador = context.Utilizadors.Where(u => u.ID_Utilizador == userid).SingleOrDefault();

            if (animal.Utilizador != null)
            {
                animal.Data_adoçao = DateTime.Now;

                var inst = context.Instituiçao.Where(i => i.ID_Instituiçao == animal.Instituiçao).SingleOrDefault();

                string para = inst.Email;
                string de = "TakeAMeDHomeMIN0349@hotmail.com";
                string pass = "87fD5606H8";
                string assunto = "O utilizador " + utilizador.Nome + " aceitou";
                string mensagem = "O utiizador aceitou o animal " + animal.Nome + ".";
                EnviarEmail(para, de, pass, assunto, mensagem);
            }

            context.SaveChanges();
            GridAnimais.DataBind();
            
        }

        protected void btnRecusar_Click(object sender, EventArgs e)
        {
            int animalid = int.Parse(GridAnimais.SelectedRow.Cells[1].Text);
            string userid = Session["User"].ToString();
            var animal = context.Animals.Where(a => a.ID_animal == animalid).SingleOrDefault();
            var utAnimal = context.Utilizador_Animal.Where(u => u.Utilizador == userid && u.Animal == animalid).SingleOrDefault();
            var utilizador = context.Utilizadors.Where(u => u.ID_Utilizador == userid).SingleOrDefault();

            var inst = context.Instituiçao.Where(i => i.ID_Instituiçao == animal.Instituiçao).SingleOrDefault();

            string para = inst.Email;
            string de = "TakeAMeDHomeMIN0349@hotmail.com";
            string pass = "87fD5606H8";
            string assunto = "O utilizador " + utilizador.Nome + " recusou";
            string mensagem = "O utiizador recusou o animal " + animal.Nome + ".";
            EnviarEmail(para, de, pass, assunto, mensagem);

            context.Utilizador_Animal.Remove(utAnimal);

            animal.Utilizador = null;

            context.SaveChanges();
            GridAnimais.DataBind();
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