using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo.administrador
{
    public partial class CriarAdministrador : System.Web.UI.Page
    {
        pap_DiogoEntities db = new pap_DiogoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkCriarConta_Click(object sender, EventArgs e)
        {
            Membership.CreateUser(textUsername.Text, textPassword.Text, textEmail.Text);

            //MembershipUser user = Membership.GetUser(textUsername.Text);
            //string user_id = user.ProviderUserKey.ToString();
            Roles.AddUserToRole(textUsername.Text, "administrador");
        }
    }
}