using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["muestra"]);
            using (bdchino contexto = new bdchino())
            {
                if ((string)Session["comando"] == "pl")
                {
                    var word = (from w in contexto.Palabras
                                where w.Id == id
                                select w).Take(1).First();
                    Lpalabra.Text = word.headword;
                    tbpron.Text = word.pron;
                    Tbdef.Text = word.defn;
                    tbpron.ReadOnly = true;
                    Tbdef.ReadOnly = true; 
                }
                if ((string)Session["comando"] == "ps")
                {
                    var sup = (from s in contexto.PalabrasSuplementarias
                        where s.Id == id
                        select s).Take(1).First();
                    Lpalabra.Text = sup.headword;
                    tbpron.Text = sup.pron;
                    Tbdef.Text = sup.defn;
                    tbpron.ReadOnly = true;
                    Tbdef.ReadOnly = true;
                }
            }
        }
    }
}