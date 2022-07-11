using System;
using System.Collections.Generic;
using System.IO;
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
    public partial class animal : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int.TryParse(Request.QueryString["animalid"], out int animalid);
                if (animalid > 0)
                {
                    ImagemAnimal.Attributes.Add("display", "inline");
                    var animal = context.Animals.Where(u => u.ID_animal == animalid).SingleOrDefault();
                    textNome.Text = animal.Nome;
                    if (animal.Género == "Masculino")
                        GeneroM.Checked = true;
                    else
                        GeneroF.Checked = true;

                    DropDownData.SelectedValue = animal.Idade;

                    if (animal.Porte == "Grande")
                        PorteG.Checked = true;
                    else if (animal.Porte == "Médio")
                        PorteM.Checked = true;
                    else
                        PorteP.Checked = true;

                    textCaracterísticas.Text = animal.Características;

                    int id_ = int.Parse(animal.Raça.ToString());
                    Raça r = context.Raça.Find(id_);

                    DropDownTipo.DataBind();
                    DropDownTipo.Items.FindByValue(r.Tipo.ToString()).Selected = true;
                    DropDownRaça.DataBind();
                    DropDownRaça.Items.FindByValue(id_.ToString()).Selected = true;


                    int id = int.Parse(animal.Concelho.ToString());
                    Concelho c = context.Concelhoes.Find(id);

                    DropDownDistrito.DataBind();
                    DropDownDistrito.Items.FindByValue(c.Distrito.ToString()).Selected = true;
                    DropDownConcelho.DataBind();
                    DropDownConcelho.Items.FindByValue(id.ToString()).Selected = true;

                    textCor.Text = animal.Cor;
                    if (animal.Desparazitado == true)
                        CheckDesparazitado.Checked = true;
                    else
                        CheckDesparazitado.Checked = false;

                    textVacinas.Text = animal.Vacinas;

                    if (animal.Esterilizado == true)
                        CheckEsterelizado.Checked = true;
                    else
                        CheckEsterelizado.Checked = false;

                    textDescricao.Text = animal.Descriçao;

                    AnimalImageView.ImageUrl = animal.Foto;

                }
                else
                    ImagemAnimal.Attributes.Add("display", "none");
            }
        }

        void publicar()
        {
            Animal animal = new Animal();
            animal.Nome = textNome.Text;
            if (GeneroM.Checked)
                animal.Género = "Masculino";
            else
                animal.Género = "Feminino";
            animal.Idade = DropDownData.SelectedValue.ToString();
            if (PorteG.Checked)
                animal.Porte = "Grande";
            else if (PorteM.Checked)
                animal.Porte = "Médio";
            else
                animal.Porte = "Pequeno";


            string filePath = null;
            if (ImagemAnimal.HasFile)
            {
                bool ok = false;
                string[] ext = { ".jpg", ".jpeg", ".png", ".gif", ".tiff", ".jfif" };
                string extensao = System.IO.Path.GetExtension(ImagemAnimal.FileName).ToString();
                foreach (var item in ext)
                {
                    if (extensao == item) ok = true;
                }
                if (ok)
                {
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + ImagemAnimal.FileName;
                    filePath = Server.MapPath("~/imgs/") + uniqueFileName;

                    ImagemAnimal.SaveAs(filePath);
                    animal.Foto = "~/imgs/" + uniqueFileName;
                }
                else 
                    animal.Foto = "";
            }
            else
                animal.Foto = "";

            animal.Características = textCaracterísticas.Text;
            animal.Data_de_publicaçao = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            animal.Raça = int.Parse(DropDownRaça.SelectedValue);
            animal.Concelho = int.Parse(DropDownConcelho.SelectedValue);
            animal.Cor = textCor.Text;
            animal.Instituiçao = Session["user"].ToString();
            animal.Desparazitado = CheckDesparazitado.Checked;
            animal.Vacinas = textVacinas.Text;
            animal.Esterilizado = CheckEsterelizado.Checked;
            animal.Descriçao = textDescricao.Text;

            int distrito = int.Parse(DropDownDistrito.SelectedValue);
            int concelho = int.Parse(DropDownConcelho.SelectedValue);
            int tipo = int.Parse(DropDownTipo.SelectedValue);
            int raça = int.Parse(DropDownRaça.SelectedValue);
            string genero = "";
            if (GeneroM.Checked)
                genero = "Masculino";
            else
                genero = "Feminino";

            string idade = "";
            idade = DropDownData.SelectedValue.ToString();

            string porte = "";
            if (PorteP.Checked)
                porte = "Pequeno";
            else if (PorteM.Checked)
                porte = "Médio";
            else
                porte = "Grande";

       

            var q = (from u in context.Utilizadors
                     join ui in context.UtilizadorInteresses on u.ID_Utilizador equals ui.Utilizador
                     where ui.Concelho == concelho
                     select new
                     {
                         u.Email,
                         ui.Tipo,
                         ui.Raça,
                         ui.Género,
                         ui.Idade,
                         ui.Porte
                     }).Distinct().ToList();


            foreach (var item in q)
            {
                string para = item.Email;
                string de = "AdocaoAd123123@hotmail.com";
                string pass = "Adocao123123";
                string assunto = "Animal publicado";
                string mensagem = "Um animal do seu interesse foi publicado clique no link para mais informções";
                string image = animal.Foto;
                string nomeAnimal = animal.Nome;
                if (item.Tipo is null && item.Género is null && item.Idade is null && item.Porte is null)
                    EnviarEmail(para, de, pass, assunto, mensagem, image, nomeAnimal, animal.ID_animal);
                else if (item.Tipo == 0 && item.Género == "0" && item.Idade == "0" && item.Porte == "0")
                    EnviarEmail(para, de, pass, assunto, mensagem, image, nomeAnimal, animal.ID_animal);
                else if (item.Raça == animal.Raça || item.Género == animal.Género || item.Idade == animal.Idade || item.Porte == animal.Porte)
                    EnviarEmail(para, de, pass, assunto, mensagem, image, nomeAnimal, animal.ID_animal);
            }

            context.Animals.Add(animal);
            context.SaveChanges();
        }

        void editar(int id)
        {
            Animal animal = context.Animals.Find(id);
            animal.Nome = textNome.Text;
            if (GeneroM.Checked)
                animal.Género = "Masculino";
            else
                animal.Género = "Feminino";
            animal.Idade = DropDownData.SelectedValue.ToString();
            if (PorteG.Checked)
                animal.Porte = "Grande";
            else if (PorteM.Checked)
                animal.Porte = "Médio";
            else
                animal.Porte = "Pequeno";

            string filePath = null;
            if (ImagemAnimal.HasFile)
            {
                bool ok = false;
                string[] ext = { ".jpg", ".jpeg", ".png", ".gif", ".tiff", ".jfif" };
                string extensao = System.IO.Path.GetExtension(ImagemAnimal.FileName).ToString();
                foreach (var item in ext)
                {
                    if (extensao == item) ok = true;
                }
                if (ok)
                {
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + ImagemAnimal.FileName;
                    filePath = Server.MapPath("~/imgs/") + uniqueFileName;

                    ImagemAnimal.SaveAs(filePath);
                    animal.Foto = "~/imgs/" + uniqueFileName;
                }
            }


            animal.Características = textCaracterísticas.Text;
            animal.Data_de_publicaçao = animal.Data_de_publicaçao;
            animal.Raça = int.Parse(DropDownRaça.SelectedValue);
            animal.Cor = textCor.Text;
            animal.Desparazitado = CheckDesparazitado.Checked;
            animal.Vacinas = textVacinas.Text;
            animal.Esterilizado = CheckEsterelizado.Checked;
            animal.Descriçao = textDescricao.Text;
                       
            context.SaveChanges();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["animalid"] == null)
            {
                publicar();
                Response.Redirect("instituicao.aspx");
            }
            else
            {
                editar(int.Parse(Request.QueryString["animalid"]));
                Response.Redirect("instituicao.aspx");
            }
        }


        void EnviarEmail(string para, string de, string pass, string assunto, string mensagem, string image, string nomeAnimal, int animalid)
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
                mm.AlternateViews.Add(Mail_Body(image, nomeAnimal, animalid));
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

        AlternateView Mail_Body(string image, string nomeAnimal, int animalid)
        {
            string path = Server.MapPath(image); //imagem
            LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
            Img.ContentId = "MyImage";
            string str = @"  
            <table>
                <tr>
                    <td>O animal " + nomeAnimal + @" é do seu interesse e foi publicado agora.</td>
                </tr>
                <br />
                <br />
                <tr>
                    <td>Clique no link abaixo para ser redirecionado para a página do animal.</td>
                </tr>
                <br />
                <tr>
                    <td>http://localhost:50728/InfoAnimal.aspx?animalid=" + animalid +@"</td>
                </tr>               
                <br />
                <br />
                <tr>  
                    <td>  
                      <img src=cid:MyImage  id='img' alt='' width='350px' height='350px'/>  
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