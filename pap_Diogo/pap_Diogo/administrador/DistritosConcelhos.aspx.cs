using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.administrador
{
    public partial class DistritosConcelhos : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GetDistritos();
            }
        }

        void GetDistritos()
        {
            var q = from s in context.Distritoes
                    orderby s.Nome ascending
                    select new
                    {

                        ID = s.ID,
                        Nome = s.Nome,
                        //concelhos = s.Concelhoes
                    };
            GridDistritos.DataSource = q.ToList();
            GridDistritos.DataBind();
        }
        void GetConcelhos(int id)
        {
            var q = from s in context.Concelhoes
                    orderby s.Nome ascending
                    where s.ID == id
                    select new
                    {

                        ID = s.ID,
                        Nome = s.Nome
                    };
            GridConcelhos.DataSource = q.ToList();
            GridConcelhos.DataBind();
        }

        protected void GridDistritos_SelectedIndexChanged(object sender, EventArgs e)
        {
            textDistrito.Text = GridDistritos.SelectedRow.Cells[2].Text;
            //int id = int.Parse(GridConcelhos.SelectedRow.Cells[1].Text);
            //GetConcelhos(id);
        }
        protected void GridDistritos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }



        protected void GridConcelhos_SelectedIndexChanged(object sender, EventArgs e)
        {
            textConcelho.Text = GridConcelhos.SelectedRow.Cells[2].Text;
        }

        protected void GridConcelhos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}