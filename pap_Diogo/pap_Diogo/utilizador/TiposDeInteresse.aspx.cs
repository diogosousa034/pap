using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.utilizador
{
    public partial class TiposDeInteresse : System.Web.UI.Page
    {
        pap_DiogoEntities context = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userid = Session["User"].ToString();
                var user = context.Utilizadors.Where(u => u.ID_Utilizador == userid).SingleOrDefault();
                var ui = context.UtilizadorInteresses.Where(u => u.Utilizador == userid).SingleOrDefault();
                if (ui is null && user.Concelho != null)
                {
                    UtilizadorInteresse uis = new UtilizadorInteresse();
                    uis.Concelho = user.Concelho;
                    uis.Utilizador = userid;
                    context.UtilizadorInteresses.Add(uis);
                    context.SaveChanges();                    
                }

                int idc = 0;
                int.TryParse(ui.Concelho.ToString(), out idc);
                Concelho c = context.Concelhoes.Find(idc);

                if (ui.Concelho != null)
                {
                    dropDistritos.DataBind();
                    dropDistritos.Items.FindByValue(c.Distrito.ToString()).Selected = true;
                    dropConcelhos.DataBind();
                    dropConcelhos.Items.FindByValue(idc.ToString()).Selected = true;
                }

                int idr = 0;
                int.TryParse(ui.Raça.ToString(), out idr);
                Raça r = context.Raça.Find(idr);

                if (ui.Raça != null)
                {
                    dropTipos.DataBind();
                    dropTipos.Items.FindByValue(r.Tipo.ToString()).Selected = true;
                    dropRaças.DataBind();
                    dropRaças.Items.FindByValue(idr.ToString()).Selected = true;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string userid = Session["User"].ToString();
            var ui = context.UtilizadorInteresses.Where(u => u.Utilizador == userid).SingleOrDefault();
            UtilizadorInteresse uis = new UtilizadorInteresse();

            ui.Concelho = int.Parse(dropConcelhos.SelectedValue);
            ui.Raça = int.Parse(dropRaças.SelectedValue);
            ui.Idade = dropIdade.SelectedValue;
            ui.Género = dropGenero.SelectedValue;
            ui.Porte = dropPorte.SelectedValue;
            ui.Utilizador = userid;

            if (ui is null)
            {
                uis.Concelho = int.Parse(dropConcelhos.SelectedValue);
                uis.Raça = int.Parse(dropRaças.SelectedValue);
                uis.Idade = dropIdade.SelectedValue;
                uis.Género = dropGenero.SelectedValue;
                uis.Utilizador = userid;
                context.UtilizadorInteresses.Add(uis);
            }
            context.SaveChanges();
        }
    }
}