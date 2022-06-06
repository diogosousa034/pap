using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo
{
    public partial class home : System.Web.UI.Page
    {
        int CurrentPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["contador"] = 0;
            }
            CurrentPage = (int)ViewState["contador"];
        }

        void BindListCidades(DataTable table)
        {
            PagedDataSource paged = new PagedDataSource();
            paged.DataSource = table.DefaultView;
            paged.PageSize = 4;
            paged.AllowPaging = true;
            paged.CurrentPageIndex = CurrentPage;
            linkPrimeira1.Enabled = !paged.IsFirstPage;
            linkAnterior1.Enabled = !paged.IsFirstPage;
            linkSeguinte1.Enabled = !paged.IsLastPage;
            linkUltimo1.Enabled = !paged.IsLastPage;
            ViewState["total"] = paged.PageCount;
            DataListAnimais.DataSource = paged;
            DataListAnimais.DataBind();
            ViewState["dataSource"] = table;
        }

        protected void linkPrimeira1_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            ViewState["contador"] = CurrentPage;
            //GetCidades();
        }

        protected void linkAnterior1_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage -= 1;
            ViewState["contador"] = CurrentPage;
            BindListCidades((DataTable)ViewState["dataSource"]);
        }

        protected void linkSeguinte1_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage += 1;
            ViewState["contador"] = CurrentPage;
            BindListCidades((DataTable)ViewState["dataSource"]);
        }

        protected void linkUltimo1_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["total"] - 1;
            ViewState["contador"] = CurrentPage;
            BindListCidades((DataTable)ViewState["dataSource"]);
        }
    }
}