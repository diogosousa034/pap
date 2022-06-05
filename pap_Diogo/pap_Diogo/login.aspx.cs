using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(Login1.UserName);
            Session["user"] = user.ProviderUserKey.ToString();
            //Response.Redirect("home.aspx");
            if (Roles.IsUserInRole(Login1.UserName, "utilizador"))
                Response.Redirect("utilizador/utilizador.aspx");
            else if (Roles.IsUserInRole(Login1.UserName, "instituicao"))
                Response.Redirect("instituicao/instituicao.aspx");
            else if (Roles.IsUserInRole(Login1.UserName, "administrador"))
                Response.Redirect("administrador/administrador.aspx");
        }

    }
}