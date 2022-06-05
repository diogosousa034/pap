using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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
            if (Request.QueryString["animalid"] == null)
            {
                var animal = context.Animals.Find(Request.QueryString["animalid"]);
                textNome.Text = animal.Nome;
                if (animal.Género == "Masculino")
                    GeneroM.Checked = true;
                else
                    GeneroF.Checked = false;

                textData.Text = animal.Data_de_nascimento.ToString();

                if (animal.Porte == "Grande")
                    PorteG.Checked = true;
                else if (animal.Porte == "Médio")
                    PorteM.Checked = true;
                else
                    PorteP.Checked = true;

                textCaracterísticas.Text = animal.Características;
                DropDownRaça.SelectedIndex = int.Parse(animal.Raça.ToString());

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
            animal.Data_de_nascimento = DateTime.Parse(textData.Text);
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
            animal.Cor = textCor.Text;
            //falta meter o id da instituição
            animal.Instituiçao = Session["user"].ToString();
            animal.Desparazitado = CheckDesparazitado.Checked;
            animal.Vacinas = textVacinas.Text;
            animal.Esterilizado = CheckEsterelizado.Checked;
            animal.Descriçao = textDescricao.Text;

            context.Animals.Add(animal);
            context.SaveChanges();
        }

        void editar(int id)
        {
            var animal = context.Animals.Find(id);
            animal.Nome = textNome.Text;
            if (GeneroM.Checked)
                animal.Género = "Masculino";
            else
                animal.Género = "Feminino";
            animal.Data_de_nascimento = DateTime.Parse(textData.Text);
            if (PorteG.Checked)
                animal.Porte = "Grande";
            else if (PorteM.Checked)
                animal.Porte = "Médio";
            else
                animal.Porte = "Pequeno";
            if (ImagemAnimal.HasFile == true)
            {
                animal.Foto = ImagemAnimal.FileName;
                ImagemAnimal.SaveAs(Server.MapPath("~/imgs/") + ImagemAnimal.FileName);
            }
            animal.Características = textCaracterísticas.Text;
            animal.Data_de_publicaçao = DateTime.Now;
            animal.Raça = DropDownRaça.SelectedIndex;
            animal.Cor = textCor.Text;
            //falta meter o id da instituição
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
                editar(int.Parse(Request.QueryString["animalid"]));
        }
    }
}