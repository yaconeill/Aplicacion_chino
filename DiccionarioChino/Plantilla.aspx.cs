using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Plantilla : System.Web.UI.Page
    {
        /// <summary>
        /// Al cargar la página por primera vez pone todos los elementos a false, para ocultarlos hasta que sea necesario,
        /// tambien se determina ...
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
        /// <summary>
        /// Carga los datos en el desplegable "tema" en función de la fuente elegida.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
        /// <summary>
        /// Visibiliza el desplegable de "fuente" y carga los datos en el desplegable.
        /// Ademas oculta el deplegable de "tema", que al cambiar de  radiobutton y volver se queda visible y, ocuta el panel cantidad.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
        /// <summary>
        /// Evento que muestra el panel cantidad y pone a false todo lo relacionado con las palabras del libro.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rbsuple_OnCheckedChanged(object sender, EventArgs e)
        {
            cantidad.Visible = true;
            DDfuenteL.Visible = false;
            DDTemaL.Visible = false;
            Gnralista.Visible = false;
        }
        /// <summary>
        /// Genera una tabla con cada palabra, de la bd de palabras suplementarias, en una fila distinta, separando 
        /// los caracteres de la palabra en array de char para mostrarlo en columnas distintas.
        /// Se hace lo mismo con el pinyin pero este se separa por el número del tono.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
                    HtmlTableRow row_pin;
                    HtmlTableCell cell_pin;
                    row = new HtmlTableRow();
                    row_pin = new HtmlTableRow();
                    for (int j = 0; j < 10; j++)
                    {
                        cell = new HtmlTableCell();
                        cell_pin = new HtmlTableCell();
                        if (j > word.Length - 1)
                        {
                            cell.InnerHtml = " ";
                            cell_pin.InnerHtml = " ";
                        }
                        else
                        {
                            cell_pin.InnerHtml = pron[j];
                            cell.InnerHtml = word[j].ToString();
                        }
                        row_pin.Cells.Add(cell_pin);
                        row.Cells.Add(cell);
                    }
                    table1.Rows.Add(row_pin);
                    table1.Rows.Add(row);
                }
                Place.Controls.Add(table1);
            }
            btprint.Visible = true;
        }
        /// <summary>
        /// Muestra el botón generarlista.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DDTemaL_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Gnralista.Visible = true;
        }
        /// <summary>
        /// Genera una tabla con cada palabra, de la bd de palabras del libro, en una fila distinta, separando 
        /// los caracteres de la palabra en array de char para mostrarlo en columnas distintas.
        /// Se hace lo mismo con el pinyin pero este se separa por el número del tono.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
                    HtmlTableRow row_pin;
                    HtmlTableCell cell_pin;
                    row = new HtmlTableRow();
                    row_pin = new HtmlTableRow();
                    for (int j = 0; j < 10; j++)
                    {
                        cell_pin = new HtmlTableCell();
                        cell = new HtmlTableCell();
                        if (j > word.Count - 1)
                        {
                            cell_pin.InnerHtml = " ";
                            cell.InnerHtml = " ";
                        }
                        else
                        {
                            cell.InnerHtml = word[j].ToString();
                        }
                        if (j < pron.Count)
                        {
                            cell_pin.InnerHtml = pron[j].Trim();
                        }
                        row_pin.Cells.Add(cell_pin);
                        row.Cells.Add(cell);
                    }
                    table1.Rows.Add(row_pin);
                    table1.Rows.Add(row);
                }
                Place.Controls.Add(table1);
            }
            btprint.Visible = true;
        }
    }
}