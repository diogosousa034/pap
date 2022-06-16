using System;
using System.Collections.Generic;
using System.Linq;
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
            //var userAnimal = context.Utilizador_Animal.ToList();
            //var animal = context.Animals.ToList();
            //List<Animal> animals = new List<Animal>();
            //foreach (var item in userAnimal)
            //{
            //    foreach (var item2 in animal)
            //    {
            //        if (item.Animal == item2.ID_animal)
            //        {
            //            animals.Add(item2);
            //        }
            //    }
            //}

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

            //var user = context.Utilizadors.Where(u => u.ID_Utilizador == user_id)
            //    .Join(context.Concelhoes, utilizador => utilizador.Concelho, concelho => concelho.ID)
            //    .join .FirstOrDefault();


            //studentList.Join(// outer sequence 
            //          standardList,  // inner sequence 
            //          student => student.StandardID,    // outerKeySelector
            //          standard => standard.StandardID,  // innerKeySelector
            //          (student, standard) => new  // result selector
            //          {
            //              StudentName = student.StudentName,
            //              StandardName = standard.StandardName
            //          });


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
    }
}