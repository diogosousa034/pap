﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.instituicao
{
    public partial class AdoçõesPendentes : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAnimais();
            }
        }

        void GetAnimais()
        {

            var q = (from a in context.Animals
                     join i in context.Instituiçao on a.Instituiçao equals i.ID_Instituiçao
                     join r in context.Raça on a.Raça equals r.ID_Raça
                     join t in context.Tipoes on r.Tipo equals t.ID_Tipo
                     where a.Data_adoçao == null && a.Utilizador == null
                     orderby a.Nome ascending
                     select new
                     {
                         ID = a.ID_animal,
                         Nome = a.Nome,
                         Tipo = t.Nome,
                         Raça = r.Nome,
                         Data = a.Data_de_publicaçao
                     }).Distinct();

            //GridAnimais.DataSource = q.ToList();
            //GridAnimais.DataBind();
        }

        protected void GridAnimais_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id_animal = int.Parse(GridAnimais.SelectedRow.Cells[1].Text);

            var result = from u in context.Utilizadors
                         join ua in (from x in context.Utilizador_Animal
                                     where x.Animal == id_animal
                                     select x)
                            on u.ID_Utilizador equals ua.Utilizador
                         select new { u.ID_Utilizador, u.Nome, u.Email };

            //gridUtilizadores.DataSource = result.ToList();
            //gridUtilizadores.DataBind();
        }

        protected void GridAnimais_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int id_animal = int.Parse(e.Row.Cells[1].Text);
                int total = (from ua in context.Utilizador_Animal where ua.Animal == id_animal select ua).Count();
                if (total > 0)
                {
                    e.Row.Cells[2].BackColor = System.Drawing.Color.Yellow;
                    e.Row.Cells[3].BackColor = System.Drawing.Color.Yellow;
                    e.Row.Cells[4].BackColor = System.Drawing.Color.Yellow;
                    e.Row.Cells[5].BackColor = System.Drawing.Color.Yellow;
                }
            }
        }

        protected void gridUtilizadores_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[1].Visible = false;
        }

        protected void gridUtilizadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            string user_id = gridUtilizadores.SelectedRow.Cells[1].Text;

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

        protected void btnDoar_Click(object sender, EventArgs e)
        {
            string user_id = gridUtilizadores.SelectedRow.Cells[1].Text;
            var user = context.Utilizadors.Where(u => u.ID_Utilizador == user_id).SingleOrDefault();

            int animal_id = int.Parse(GridAnimais.SelectedRow.Cells[1].Text);
            var animal = context.Animals.Where(a => a.ID_animal == animal_id).SingleOrDefault();

            animal.Utilizador = user.ID_Utilizador;

            context.SaveChanges();

            //enviar email a avisar a instituição
            string para = user.Email;
            string de = "AdocaoAd123123@hotmail.com";
            string pass = "Adocao123123";
            string assunto = "Adoção aceite";
            string mensagem = "O pedido de adoção do animal " + animal.Nome + " foi aceite, pode aceitar ou recusar na sua página.";
            EnviarEmail(para, de, pass, assunto, mensagem);
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