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
    }
}