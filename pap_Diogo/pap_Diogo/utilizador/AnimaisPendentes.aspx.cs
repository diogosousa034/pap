using System;
using System.Collections.Generic;
using System.Linq;
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
                e.Row.Cells[1].Visible = false;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string id_user = Session["User"].ToString();
                int total = (from a in context.Animals where a.Utilizador == id_user select a).Count();
                if (total > 0)
                {
                    e.Row.Cells[2].BackColor = System.Drawing.Color.Yellow;
                    e.Row.Cells[3].BackColor = System.Drawing.Color.Yellow;
                    e.Row.Cells[4].BackColor = System.Drawing.Color.Yellow;
                    e.Row.Cells[5].BackColor = System.Drawing.Color.Yellow;
                    e.Row.Cells[6].BackColor = System.Drawing.Color.Yellow;
                }
            }
        }

        protected void GridAnimais_SelectedIndexChanged(object sender, EventArgs e)
        {
             
            int animalid = int.Parse(GridAnimais.SelectedRow.Cells[1].Text);
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
            var animal = context.Animals.Where(a => a.ID_animal == animalid).SingleOrDefault();

            animal.Data_adoçao = DateTime.Now;

            context.SaveChanges();
        }

        protected void btnRecusar_Click(object sender, EventArgs e)
        {
            int animalid = int.Parse(GridAnimais.SelectedRow.Cells[1].Text);
            var animal = context.Animals.Where(a => a.ID_animal == animalid).SingleOrDefault();

            animal.Utilizador = null;

            context.SaveChanges();
        }
    }
}