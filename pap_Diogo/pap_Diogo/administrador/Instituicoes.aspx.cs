using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.administrador
{
    public partial class Instituicoes : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridInsituições_SelectedIndexChanged(object sender, EventArgs e)
        {
            string inst_id = GridInsituições.SelectedRow.Cells[1].Text;

            var q = (from u in context.Instituiçao
                     join c in context.Concelhoes on u.Concelho equals c.ID
                     join d in context.Distritoes on c.Distrito equals d.ID
                     where u.ID_Instituiçao == inst_id
                     select new
                     {
                         u.Nome,
                         u.Morada,
                         u.Localidade,
                         u.Código_Postal,
                         u.Telefone,
                         u.Telemóvel,
                         u.Email,
                         u.URL,
                         u.C3_Words,
                         u.Data_de_registo,
                         Concelho = c.Nome,
                         Distrito = d.Nome
                     }).FirstOrDefault();


            textNome.Text = q.Nome;
            textMorada.Text = q.Morada;
            textLocalidade.Text = q.Localidade;
            textCodigoPostal.Text = q.Código_Postal;
            textTelefone.Text = q.Telefone;
            textTelemovel.Text = q.Telemóvel;
            textEmail.Text = q.Email;
            textURL.Text = q.URL;
            text3Words.Text = q.C3_Words;
            textData.Text = DateTime.Parse(q.Data_de_registo.ToString()).ToShortDateString();
            textDistrito.Text = q.Distrito;
            textConcelho.Text = q.Concelho;            
        }

        protected void GridInsituições_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    MembershipUser user = Membership.GetUser(e.Row.Cells[1].Text);
            //    if (user.IsApproved == false)
            //        e.Row.BackColor = Color.Yellow;
            //}

            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Cells[1].Visible = false;
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(GridInsituições.SelectedRow.Cells[1].Text);
            user.IsApproved = false;
        }

        protected void btnAprovar_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(GridInsituições.SelectedRow.Cells[1].Text);
            user.IsApproved = true;

            //enviar email a avisar a instituição

        }
    }
}