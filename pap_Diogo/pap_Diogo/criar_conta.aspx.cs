using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo
{
    public partial class criar_conta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkCriarConta_Click(object sender, EventArgs e)
        {
            //1 - criar conta - Membership
            Membership.CreateUser(textUsername.Text, textPassword.Text, textEmail.Text);

            //obter o UserID
            MembershipUser user = Membership.GetUser(textUsername.Text);
            //
            string user_id = user.ProviderUserKey.ToString();

            //2 - adicionar utilizador ao grupo correspondente
            if (rbUtilizador.Checked)
                Roles.AddUserToRole(textUsername.Text, "utilizador");
            else if(rbInstituicao.Checked)
            {
                Roles.AddUserToRole(textUsername.Text, "instituicao");
                //user.IsApproved = false;
                Membership.UpdateUser(user);
            }
            //3 - criar utilizador (contexto projectos)
            pap_DiogoEntities db = new pap_DiogoEntities();

            if (rbUtilizador.Checked)
            {
                Utilizador utilizador = new Utilizador();
                utilizador.Nome = textNome.Text;
                utilizador.Email = textEmail.Text;
                utilizador.Data_de_registo = DateTime.Now;
                utilizador.ID_Utilizador = user_id;

                db.Utilizadors.Add(utilizador);
            }
            else if (rbInstituicao.Checked)
            {
                Instituiçao instituiçao = new Instituiçao();
                instituiçao.Nome = textNome.Text;
                instituiçao.Email = textEmail.Text;
                instituiçao.Data_de_registo = DateTime.Now;
                instituiçao.ID_Instituiçao = user_id;

                db.Instituiçao.Add(instituiçao);
            }

            db.SaveChanges();

            Response.Redirect("login.aspx");
        }
    }
}