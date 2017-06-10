using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Plantilla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDfuenteL.Visible = false;
                cantidad.Visible = false;
                using (bdchino contexto = new bdchino())
                {
                    var suple = (from s in contexto.PalabrasSuplementarias
                                 orderby s.Id
                                 select s).ToList();
                    tbdesde.MaxLength = suple.Count - 1;
                    tbhasta.MaxLength = suple.Count - 1;
                }
            }
            else
            {
                //using (bdchino contexto = new bdchino())
                //{
                //    if (rblibro != null)
                //    {
                //        DDfuenteL.Visible = true;
                //        var libro = (from l in contexto.Fuentes
                //                     orderby l.Id
                //                     select l).ToList();
                //        DDfuenteL.DataSource = libro;
                //        DDfuenteL.DataBind();
                //        //Add blank item at index 0.
                //        DDfuenteL.Items.Insert(0, new ListItem("--Seleccionar libro--", "0"));

                //    }
                //    if (rbsuple != null)
                //    {
                //        DDsuple.Visible = true;
                //        var suple = (from s in contexto.PalabrasSuplementarias
                //                     orderby s.Id
                //                     select s).ToList();
                //        //DDsuple.DataSource = suple;
                //        //DDsuple.DataBind();
                //        ////Add blank item at index 0.
                //        //DDsuple.Items.Insert(0, new ListItem("--Seleccionar tema--", "0"));

                //    }
                //}
            }
        }

        protected void DDfuente_OnSelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void rblibro_OnCheckedChanged(object sender, EventArgs e)
        {
            cantidad.Visible = false;
            DDfuenteL.Visible = true;
            using (bdchino contexto = new bdchino())
            {
                var libro = (from l in contexto.Fuentes
                             orderby l.Id
                             select l).ToList();
                DDfuenteL.DataSource = libro;
                DDfuenteL.DataTextField = "Fuente1";
                DDfuenteL.DataValueField = "Id";
                DDfuenteL.DataBind();
                //Add blank item at index 0.
                DDfuenteL.Items.Insert(0, new ListItem("--Seleccionar libro--", "0"));
            }
        }

        protected void rbsuple_OnCheckedChanged(object sender, EventArgs e)
        {
            cantidad.Visible = true;
            DDfuenteL.Visible = false;
        }

        protected void generar_OnClick(object sender, EventArgs e)
        {
            int dsd = 0, hasta = 0;
            if (tbdesde.Text != "")
            {
                dsd = Convert.ToInt32(tbdesde.Text);
                hasta = Convert.ToInt32(tbdesde.Text);
            }
            using (bdchino contexto = new bdchino())
            {
                var suple = (from s in contexto.PalabrasSuplementarias
                             orderby s.Id
                             select s).Skip(dsd).Take(hasta).ToList();
            }
        }
    }
}