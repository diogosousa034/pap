using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.utilizador
{
    public partial class Favoritos : System.Web.UI.Page
    {
        pap_DiogoEntities contex = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridFavoritos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[1].Visible = false;
        }

        protected void btnAnimal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../InfoAnimal.aspx?animalid=" + GridFavoritos.SelectedRow.Cells[1].Text);
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            string userid = Session["user"].ToString();
            int animalid = int.Parse(GridFavoritos.SelectedRow.Cells[1].Text);
            var a = contex.Favoritos.Where(u => u.Utilizador == userid && u.Animal == animalid).SingleOrDefault();

            contex.Favoritos.Remove(a);
            contex.SaveChanges();
            GridFavoritos.DataBind();
        }
    }
}