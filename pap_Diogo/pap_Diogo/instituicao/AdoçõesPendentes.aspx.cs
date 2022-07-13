using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
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
                Control c = e.Row.Cells[5].FindControl("Image2");

                int id_animal = int.Parse(e.Row.Cells[1].Text);
                int total = (from ua in context.Utilizador_Animal where ua.Animal == id_animal select ua).Count();

                if (c != null)
                {
                    System.Web.UI.WebControls.Image i = (System.Web.UI.WebControls.Image)c;
                    if (total > 0)
                        i.ImageUrl = "/png images/warning.png";
                    else
                        i.ImageUrl = "/png images/transparent.png";
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
            string de = "TakeAMeDHomeMIN0349@hotmail.com";
            string pass = "87fD5606H8";
            string assunto = "Adoção aceite";
            string mensagem = "O pedido de adoção do animal " + animal.Nome + " foi aceite, poderá aceitar ou recusar na sua página de pedidos pendentes.";
            string image = animal.Foto;
            string nomeAnimal = animal.Nome;
            EnviarEmail(para, de, pass, assunto, mensagem, image, nomeAnimal);
            gridUtilizadores.DataBind();
            GridAnimais.DataBind();
        }

        void EnviarEmail(string para, string de, string pass, string assunto, string mensagem, string image, string nomeAnimal)
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

                mm.IsBodyHtml = true;
                mm.AlternateViews.Add(Mail_Body(image, nomeAnimal));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp-mail.outlook.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(de, pass);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                mm.BodyEncoding = Encoding.Default;
                smtp.Port = 587;
                smtp.Send(mm);
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email enviado.');", true);
                //MessageBox.Show("Enviado com sucesso");
            }
        }

        AlternateView Mail_Body(string image, string nomeAnimal)
        {
            string path = Server.MapPath(image); //imagem
            LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
            Img.ContentId = "MyImage";
            string str = @"  
            <table>
                <tr>
                    <td>O seu pedido de adoção do animal " + nomeAnimal + @" foi aceite,<br /> poderá aceitá-lo na sua página de pedidos pendentes.</td>
                </tr>
                <tr>  
                     <td> " + txt_mensagem.Text + @"  
                    </td>  
                </tr>  
                <tr>  
                    <td>  
                      <img src=cid:MyImage  id='img' alt='' width='350px'/>  
                    </td>  
                </tr>
            </table>  
            ";
            AlternateView AV =
            AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
            AV.LinkedResources.Add(Img);
            return AV;
        }

    }
}