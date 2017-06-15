using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                DDTemaL.Visible = false;
                cantidad.Visible = false;
                using (bdchino contexto = new bdchino())
                {
                    var suple = (from s in contexto.PalabrasSuplementarias
                                 orderby s.Id
                                 select s).ToList();
                    tbdesde.MaxLength = suple.Count - 1;
                    tbcant.MaxLength = suple.Count - 1;
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
            var id = Convert.ToInt32(DDfuenteL.SelectedItem.Value);
            if (id == 0)
            {
                DDTemaL.Visible = false;
            }
            else
            {
                DDTemaL.Visible = true;
            }
            using (bdchino contexto = new bdchino())
            {
                var temas = (from t in contexto.Temas
                             join ft in contexto.FuenteTemas
                             on t.Id equals ft.IdTema
                             where ft.IdFuente == id
                             select t).ToList();
                DDTemaL.DataSource = temas;
                DDTemaL.DataTextField = "Temas";
                DDTemaL.DataValueField = "Id";
                DDTemaL.DataBind();
            }
            //Add blank item at index 0.
            DDTemaL.Items.Insert(0, new ListItem("--Seleccionar tema--", "0"));

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
            List<char> list = new List<char>();
            int dsd = 0, hasta = 0;
            if (tbdesde.Text != "")
            {
                dsd = Convert.ToInt32(tbdesde.Text);
                hasta = Convert.ToInt32(tbcant.Text);
            }
            using (bdchino contexto = new bdchino())
            {
                var suple = (from s in contexto.PalabrasSuplementarias
                             orderby s.Id
                             select s).Skip(dsd).Take(hasta).ToList();
                HtmlTable table1 = new HtmlTable();
                for (int i = 0; i < suple.Count; i++)
                {
                    var w = suple[i];
                    char[] word = w.headword.ToCharArray();

                    table1.Border = 1;
                    HtmlTableRow row;
                    HtmlTableCell cell;
                    row = new HtmlTableRow();
                    for (int j = 0; j < 10; j++)
                    {
                        cell = new HtmlTableCell();
                        if (j > word.Length - 1)
                        {
                            cell.InnerHtml = " ";
                        }
                        else
                        {
                            cell.InnerHtml = word[j].ToString();
                        }
                        row.Cells.Add(cell);
                    }
                    table1.Rows.Add(row);
                }
                Controls.Add(table1);
            }
        }

        protected void DDTemaL_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var tema = Convert.ToInt32(DDTemaL.SelectedItem.Value);
            using (bdchino contexto = new bdchino())
            {
                var palabras = (from p in contexto.Palabras
                                join tp in contexto.TemaPalabras
                                on p.Id equals tp.IdPalabra
                                where tp.IdTema == tema
                                orderby p.Id
                                select new
                                {
                                    p.Id,
                                    p.headword,
                                    p.pron,
                                    p.defn
                                }).ToList();
            }
        }
    }
}