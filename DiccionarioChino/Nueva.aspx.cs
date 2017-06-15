using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Nueva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnClick(object sender, EventArgs e)
        {
            using (bdchino contexto = new bdchino())
            {
                var npalabra = new PalabrasSuplementaria();
                npalabra.headword = tbpalabra.Text;
                npalabra.pron= tbpron.Text;
                npalabra.defn= tbdefn.Text;
                contexto.PalabrasSuplementarias.Add(npalabra);
                contexto.SaveChanges();
            }
        }
    }
}