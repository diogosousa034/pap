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
            if (e.Row.Cells.Count > 1)
            {



                if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[1].Visible = false;
                    e.Row.Cells[6].Visible = false;
                    e.Row.Cells[7].Visible = false;
                }

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Control c = e.Row.Cells[5].FindControl("Image2");
                    if (c != null)
                    {
                        System.Web.UI.WebControls.Image i = (System.Web.UI.WebControls.Image)c;
                        if (e.Row.Cells[6].Text != "&nbsp;")
                        {
                            i.ImageUrl = "/png images/warning.png";
                            if (e.Row.Cells[7].Text != "&nbsp;")
                            {
                                i.ImageUrl = "/png images/check blue.png";
                            }
                        }
                        else
                        {
                            i.ImageUrl = "/png images/check green.png";
                        }
                    }

                }
            }
        }
    }
}