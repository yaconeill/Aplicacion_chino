using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                var plibro = (from p in contexto.Palabras
                    orderby p.Id
                    select p.headword).ToList();
                var psuple = (from p in contexto.PalabrasSuplementarias
                    orderby p.Id
                    select p.headword).ToList();

                PLibro.Text = (plibro.Count - 1).ToString();
                PSuple.Text = (psuple.Count - 1).ToString();
            }
        }
    }
}