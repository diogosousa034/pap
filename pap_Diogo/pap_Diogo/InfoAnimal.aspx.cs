using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo
{
    public partial class InfoAnimal : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int.TryParse(Request.QueryString["animalid"], out int animalid);
                if (animalid > 0)
                {
                    //var animal = context.Animals.Where(u => u.ID_animal == animalid).SingleOrDefault();

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

                    textNome.Text = q.Nome;
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

        }

        protected void btnAdotarPendente_Click(object sender, EventArgs e)
        {
            int.TryParse(Request.QueryString["animalid"], out int animalid);
            string User_id = Session["user"].ToString();

            var u = context.Utilizadors.Where(l => l.ID_Utilizador == User_id).SingleOrDefault();
            if (u != null)
            {            
                Utilizador_Animal UA = new Utilizador_Animal();
                UA.Utilizador = User_id;
                UA.Animal = animalid;

                context.Utilizador_Animal.Add(UA);
                context.SaveChanges();
            }
        }
    }
}