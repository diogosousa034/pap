using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.instituicao
{
    public partial class EditarInstituição : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string instID = Session["user"].ToString();
                var inst = context.Instituiçao.Where(u => u.ID_Instituiçao == instID).SingleOrDefault();

                textNome.Text = inst.Nome;
                textMorada.Text = inst.Morada;
                textLocalidade.Text = inst.Localidade;
                textCodigoPostal.Text = inst.Código_Postal;
                textTelefone.Text = inst.Telefone;
                textTelemovel.Text = inst.Telemóvel;
                textEmail.Text = inst.Email;
                textURL.Text = inst.URL;
                text3Words.Text = inst.C3_Words;

                int id = int.Parse(inst.Concelho.ToString());
                Concelho c = context.Concelhoes.Find(id);

                DropDownDistritos.DataBind();
                DropDownDistritos.Items.FindByValue(c.Distrito.ToString()).Selected = true;
                DropDownConcelhos.DataBind();
                DropDownConcelhos.Items.FindByValue(id.ToString()).Selected = true;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string instID = Session["user"].ToString();
            var inst = context.Instituiçao.Where(u => u.ID_Instituiçao == instID).SingleOrDefault();

            inst.Nome = textNome.Text;
            inst.Morada = textMorada.Text;
            inst.Localidade = textLocalidade.Text;
            inst.Código_Postal = textCodigoPostal.Text;
            inst.Telefone = textTelefone.Text;
            inst.Telemóvel = textTelemovel.Text;
            inst.Email = textEmail.Text;
            inst.URL = textURL.Text;
            inst.C3_Words = text3Words.Text;
            inst.Concelho = int.Parse(DropDownConcelhos.SelectedValue);

            context.SaveChanges();

        }
    }
}