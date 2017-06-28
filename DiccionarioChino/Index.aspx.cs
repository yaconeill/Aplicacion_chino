using System;
using System.Linq;

namespace DiccionarioChino
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            using (bdchino contexto = new bdchino())
            {
                try
                {
                    var plibro = (from p in contexto.Palabras
                                  orderby p.Id
                                  select p.headword).ToList();
                    var psuple = (from p in contexto.PalabrasSuplementarias
                                  orderby p.Id
                                  select p.headword).ToList();

                    PLibro.Text = (plibro.Count - 1).ToString();
                    PSuple.Text = (psuple.Count - 1).ToString();
                    Lplant.Text = ((plibro.Count - 1) + (psuple.Count - 1)).ToString();
                }
                catch (Exception)
                {
                    ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('No se ha podido conectar con la base de datos');", true);
                }
            }
        }
    }
}