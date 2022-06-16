using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
                GetAnimais();
                ViewState["contador"] = 0;
            }
            CurrentPage = (int)ViewState["contador"];
        }


        void GetAnimais()
        {
            //bool where = false;
            string query = "SELECT A.ID_animal, A.Nome, R.Nome 'Raça', A.Foto, A.Género, A.Porte FROM Animal A JOIN Raça R ON A.Raça = R.ID_Raça JOIN Tipo T ON T.Id_Tipo = R.Tipo JOIN Concelho C ON C.ID = A.Concelho WHERE A.[Data adoçao] is null ";

            if (dropTipos.SelectedIndex > 0)
            {
                query += " AND R.Tipo = " + dropTipos.SelectedValue.ToString();
                //if (where == true)
                //    query += " AND R.Tipo = " + dropTipos.SelectedValue.ToString();
                //else 
                //{
                //    query += " WHERE R.Tipo = " + dropTipos.SelectedValue.ToString();
                //    where = true;
                //}

            }
            if (dropRaças.SelectedIndex > 0)
            {
                query += " AND R.ID_Raça = " + dropRaças.SelectedValue.ToString();
                //if (where == true)
                //    query += " AND R.ID_Raça = " + dropRaças.SelectedValue.ToString();
                //else
                //{
                //    query += " WHERE R.ID_Raça = " + dropRaças.SelectedValue.ToString();
                //    where = true;
                //}
            }

            if (dropDistritos.SelectedIndex > 0)
            {
                query += " AND C.Distrito = " + dropDistritos.SelectedValue.ToString();
                //if (where == true)
                //    query += " AND C.Distrito = " + dropDistritos.SelectedValue.ToString();
                //else
                //{
                //    query += " WHERE C.Distrito = " + dropDistritos.SelectedValue.ToString();
                //    where = true;
                //}
            }

            if (dropConcelhos.SelectedIndex > 0)
            {
                query += " AND C.ID = " + dropConcelhos.SelectedValue.ToString();
                //if (where == true)
                //    query += " AND C.ID = " + dropConcelhos.SelectedValue.ToString();
                //else
                //{
                //    query += " WHERE C.ID = " + dropConcelhos.SelectedValue.ToString();
                //    where = true;
                //}
            }

            if (dropGenero.SelectedIndex > 0)
            {
                query += " AND A.Género = '" + dropGenero.SelectedValue.ToString() + "'";
                //if (where == true)
                //    query += " AND A.Género = '" + dropGenero.SelectedValue.ToString() + "'";
                //else
                //{
                //    query += " WHERE A.Género = '" + dropGenero.SelectedValue.ToString() + "'";
                //    where = true;
                //}
            }

            if (dropIdade.SelectedIndex > 0)
            {
                query += " AND A.Idade = '" + dropIdade.SelectedValue.ToString() + "'";
                //if (where == true)
                //    query += " AND A.Idade = '" + dropIdade.SelectedValue.ToString() + "'";
                //else
                //{
                //    query += " WHERE A.Idade = '" + dropIdade.SelectedValue.ToString() + "'";
                //    where = true;
                //}
            }

            query += " ORDER BY A.Nome ASC";

            SqlConnection connection = new SqlConnection
            (@"data source=.\sqlexpress; initial catalog=pap_Diogo; " +
            "integrated security = true;");
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader;
            DataTable table = new DataTable();
            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();
            BindListAnimais(table);
        }

        void BindListAnimais(DataTable table)
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
            GetAnimais();
        }

        protected void linkAnterior1_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage -= 1;
            ViewState["contador"] = CurrentPage;
            BindListAnimais((DataTable)ViewState["dataSource"]);
        }

        protected void linkSeguinte1_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage += 1;
            ViewState["contador"] = CurrentPage;
            BindListAnimais((DataTable)ViewState["dataSource"]);
        }

        protected void linkUltimo1_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["total"] - 1;
            ViewState["contador"] = CurrentPage;
            BindListAnimais((DataTable)ViewState["dataSource"]);
        }

        protected void dropDistritos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAnimais();
        }

        protected void dropConcelhos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAnimais();
        }

        protected void dropTipos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAnimais();
        }

        protected void dropRaças_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAnimais();
        }

        protected void dropIdade_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAnimais();
        }

        protected void dropGenero_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAnimais();
        }
    }
}