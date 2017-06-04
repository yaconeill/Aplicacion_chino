using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Palabras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                using (bdchino contexto = new bdchino())
                {
                    try
                    {
                        var palabra = (from f in contexto.Palabras
                                      orderby f.Id
                                      select f.headword).ToList();
                        DDfuente.DataSource = palabra;
                        DDfuente.DataTextField = "Palabras";
                        DDfuente.DataValueField = "Id";
                        DDfuente.DataBind();
                    }
                    catch (Exception)
                    {
                        var mensaje = "No se ha podido conectar con la base de datos.";
                        ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('" + mensaje + "');", true);
                    }
                }
            }
        }

        protected void DDfuente_OnLoad(object sender, EventArgs e)
        {

        }
    }
}