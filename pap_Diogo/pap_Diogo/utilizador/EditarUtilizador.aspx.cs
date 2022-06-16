using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.utilizador
{
    public partial class EditarUtilizador : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string UserID = Session["user"].ToString();
                var user = context.Utilizadors.Where(u => u.ID_Utilizador == UserID).SingleOrDefault();

                textNome.Text = user.Nome;
                textEmail.Text = user.Email;
                textTelefone.Text = user.Telefone;

                int id = int.Parse(user.Concelho.ToString());
                Concelho c = context.Concelhoes.Find(id);

                dropDownDistrito.DataBind();
                dropDownDistrito.Items.FindByValue(c.Distrito.ToString()).Selected = true;
                dropDownConcelho.DataBind();
                dropDownConcelho.Items.FindByValue(id.ToString()).Selected = true;
            }
        }

        protected void btnEditarUSer_Click(object sender, EventArgs e)
        {
            string UserID = Session["user"].ToString();
            var user = context.Utilizadors.Where(u => u.ID_Utilizador == UserID).SingleOrDefault();

            user.Nome = textNome.Text;
            user.Email = textEmail.Text;
            user.Telefone = textTelefone.Text;
            user.Concelho = int.Parse(dropDownConcelho.SelectedValue);

            context.SaveChanges();
        }
    }
}