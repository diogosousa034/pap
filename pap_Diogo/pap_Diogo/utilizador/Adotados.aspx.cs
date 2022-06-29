using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.utilizador
{
    public partial class Adotados : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridAnimaisAdotados_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[7].Visible = false;
            }
                
        }

        protected void GridAnimaisAdotados_SelectedIndexChanged(object sender, EventArgs e)
        {
            string inst_id = GridAnimaisAdotados.SelectedRow.Cells[7].Text;

            var q = (from i in context.Instituiçao
                     join c in context.Concelhoes on i.Concelho equals c.ID
                     join d in context.Distritoes on c.Distrito equals d.ID
                     where i.ID_Instituiçao == inst_id
                     select new
                     {
                         i.Nome,                                               
                         i.Morada,
                         i.Localidade,
                         i.Código_Postal,
                         i.Telefone,
                         i.Telemóvel,
                         i.Email,
                         i.URL,
                         i.C3_Words,
                         i.Data_de_registo,
                         Concelho = c.Nome,
                         Distrito = d.Nome
                     }).FirstOrDefault();

            textNome.Text = q.Nome;
            textMorada.Text = q.Morada;
            textLocalidade.Text = q.Localidade;
            textCodigoPostal.Text = q.Código_Postal;         
            textTelefone2.Text = q.Telefone;
            textTelemovel.Text = q.Telemóvel;
            textEmail.Text = q.Email;
            LinkInstitucao.InnerText = q.URL;
            LinkInstitucao.HRef = q.URL;
            text3Words.Text = q.C3_Words;
            textDistrito.Text = q.Distrito;
            textConcelho.Text = q.Concelho;
        }

        protected void btnVisitarInstituição_Click(object sender, EventArgs e)
        {

        }
    }
}