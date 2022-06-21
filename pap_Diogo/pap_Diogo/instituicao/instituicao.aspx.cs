using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.instituicao
{
    public partial class instituicao : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void linkNovoAnimal_Click(object sender, EventArgs e)
        {
            Response.Redirect("animal.aspx");
        }

        protected void linkEditar_Click(object sender, EventArgs e)
        {
            var taswfef = gridAnimais.SelectedRow.Cells[1].Text;
            Response.Redirect("animal.aspx?animalid=" + gridAnimais.SelectedRow.Cells[1].Text);
        }

        protected void gridAnimais_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells.Count > 1) {
                e.Row.Cells[1].Visible = false;
            }


            //int id_animal = int.Parse(e.Row.Cells[1].Text);
            //int total = (from ua in context.Utilizador_Animal where ua.Animal == int.Parse(id_animal) select ua).Count();
            //if (total > 0)
            //{
            //    e.Row.Cells[2].BackColor = System.Drawing.Color.Yellow;
            //    e.Row.Cells[3].BackColor = System.Drawing.Color.Yellow;
            //    e.Row.Cells[4].BackColor = System.Drawing.Color.Yellow;
            //    e.Row.Cells[5].BackColor = System.Drawing.Color.Yellow;
            //}



        }
    }
}