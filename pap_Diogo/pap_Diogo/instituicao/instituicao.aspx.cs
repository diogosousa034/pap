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
            //if(gridAnimais.SelectedRow.Cells[1].Text)
            int animalid = int.Parse(gridAnimais.SelectedRow.Cells[1].Text);
            var animal = context.Animals.Where(a => a.ID_animal == animalid).SingleOrDefault();
            if(animal.Data_de_adoção_final == null)
                Response.Redirect("animal.aspx?animalid=" + gridAnimais.SelectedRow.Cells[1].Text);
            else
                Response.Write("<script LANGUAGE='JavaScript' >alert('Animal já adotado, ou em processo do mesmo, impossível editar')</script>");
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

        protected void linkRemover_Click(object sender, EventArgs e)
        {
            int animal_id = int.Parse(gridAnimais.SelectedRow.Cells[1].Text);
            var animal = context.Animals.Where(a => a.ID_animal == animal_id).SingleOrDefault();
            var utA = context.Utilizador_Animal.Where(a => a.Animal == animal_id).ToList();

            if (utA.Count > 0 || animal.Data_adoçao != null || animal.Data_de_adoção_final != null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Animal já adotado, ou em processo do mesmo, impossível remover')</script>");
            }
            else
            {
                var fav = context.Favoritos.Where(a => a.Animal == animal_id);

                foreach (var item in fav)
                {
                    context.Favoritos.Remove(item);
                }

                context.Animals.Remove(animal);
                context.SaveChanges();
            }
            
        }
    }
}