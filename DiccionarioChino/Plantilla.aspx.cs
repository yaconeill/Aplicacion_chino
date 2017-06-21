using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;

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
                Gnralista.Visible = false;
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
                lbfuente.Text = "";
            }
            btprint.Visible = false;
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
            DDTemaL.Visible = false;
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
            DDTemaL.Visible = false;
            Gnralista.Visible = false;
        }

        protected void generar_OnClick(object sender, EventArgs e)
        {
            int dsd = 0, hasta = 0;
            char[] tonos = { '1', '2', '3', '4', '5' };
            if (tbdesde.Text != "")
            {
                dsd = Convert.ToInt32(tbdesde.Text);
                hasta = Convert.ToInt32(tbcant.Text);
            }
            using (bdchino contexto = new bdchino())
            {
                var palabra = (from s in contexto.PalabrasSuplementarias
                               orderby s.Id
                               select s).Skip(dsd).Take(hasta).ToList();
                HtmlTable table1 = new HtmlTable();
                for (int i = 0; i < palabra.Count; i++)
                {
                    var w = palabra[i];
                    char[] word = w.headword.ToCharArray();
                    string[] pron = w.pron.Split(tonos);

                    table1.Border = 1;
                    HtmlTableRow row;
                    HtmlTableCell cell;
                    HtmlTableRow row_ping;
                    HtmlTableCell cell_ping;
                    row = new HtmlTableRow();
                    row_ping = new HtmlTableRow();
                    for (int j = 0; j < 10; j++)
                    {
                        cell = new HtmlTableCell();
                        cell_ping = new HtmlTableCell();
                        if (j > word.Length - 1)
                        {
                            cell.InnerHtml = " ";
                            cell_ping.InnerHtml = " ";
                        }
                        else
                        {
                            cell_ping.InnerHtml = pron[j];
                            cell.InnerHtml = word[j].ToString();
                        }
                        row_ping.Cells.Add(cell_ping);
                        row.Cells.Add(cell);
                    }
                    table1.Rows.Add(row_ping);
                    table1.Rows.Add(row);
                }
                Place.Controls.Add(table1);
            }
            btprint.Visible = true;
        }

        protected void DDTemaL_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Gnralista.Visible = true;
        }

        protected void Gnralista_OnClick(object sender, EventArgs e)
        {
            var tema = Convert.ToInt32(DDTemaL.SelectedItem.Value);
            char[] tonos = { '1', '2', '3', '4', '5' };
            lbfuente.Text = "Tema " + tema;
            using (bdchino contexto = new bdchino())
            {
                var palabra = (from p in contexto.Palabras
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
                HtmlTable table1 = new HtmlTable();
                for (int i = 0; i < palabra.Count; i++)
                {
                    var w = palabra[i];
                    List<char> word = w.headword.ToCharArray().ToList();
                    List<string> pron = w.pron.Trim().Split(tonos).ToList();
                    foreach (char c in word.Reverse<char>())
                    {
                        if (c == ' ')
                        {
                            word.Remove(c);
                        }
                        if (c == '(' || c == ')')
                        {
                            word.Remove(c);
                        }
                    }
                    foreach (string c in pron.Reverse<string>())
                    {
                        if (c == " ")
                        {
                            pron.Remove(c);
                        }
                        if (c == ")")
                        {
                            pron.Remove(c);
                        }
                    }

                    table1.Border = 1;
                    HtmlTableRow row;
                    HtmlTableCell cell;
                    HtmlTableRow row_ping;
                    HtmlTableCell cell_ping;
                    row = new HtmlTableRow();
                    row_ping = new HtmlTableRow();
                    for (int j = 0; j < 10; j++)
                    {
                        cell_ping = new HtmlTableCell();
                        cell = new HtmlTableCell();
                        if (j > word.Count - 1)
                        {
                            cell_ping.InnerHtml = " ";
                            cell.InnerHtml = " ";
                        }
                        else
                        {
                            cell.InnerHtml = word[j].ToString();
                        }
                        if (j < pron.Count)
                        {
                            cell_ping.InnerHtml = pron[j].Trim();
                        }
                        row_ping.Cells.Add(cell_ping);
                        row.Cells.Add(cell);
                    }
                    table1.Rows.Add(row_ping);
                    table1.Rows.Add(row);
                }
                Place.Controls.Add(table1);
            }
            btprint.Visible = true;
        }
    }
}