using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pap_Diogo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Roles.CreateRole("utilizador");
            //Roles.CreateRole("instituicao");
            //Roles.CreateRole("administrador");

            Membership.CreateUser("diogo", "123123", "diogosousampt03@gmail.com");
            Roles.AddUserToRole("diogo", "administrador");


        }
    }
}