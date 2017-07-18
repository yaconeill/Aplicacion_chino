using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Nueva : System.Web.UI.Page
    {
        /// <summary>
        /// Booleano que se utiliza para una vez se han guardado los datos, estando en true, 
        /// entra en un condicional para mostrar un mensaje
        /// </summary>
        private bool _ok;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialRow();
            }
        }
        /// <summary>
        /// Guarda en la base de datos los campos de la pestaña para agregar una palabra
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnClick(object sender, EventArgs e)
        {
            using (bdchino contexto = new bdchino())
            {
                var npalabra = new PalabrasSuplementaria();
                npalabra.headword = tbpalabra.Text.Trim();
                npalabra.pron = (tbpron.Text).ToLower().Trim();
                npalabra.defn = tbdefn.Text.Trim();
                if (npalabra.headword != "" && npalabra.pron != "" && npalabra.defn != "")
                {
                    var p = contexto.PalabrasSuplementarias.SingleOrDefault(x => x.headword == tbpalabra.Text);
                    if (p.headword == tbpalabra.Text && p.pron == tbpron.Text && p.defn == tbdefn.Text)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('La palabra introducida ya existe.');", true);
                    }
                    else
                    {
                        contexto.PalabrasSuplementarias.Add(npalabra);
                        //contexto.SaveChanges();
                        _ok = true;
                    }

                    contexto.PalabrasSuplementarias.Add(npalabra);
                    //contexto.SaveChanges();
                    tbpalabra.Text = "";
                    tbpron.Text = "";
                    tbdefn.Text = "";
                    Aviso();
                }
            }
        }
        /// <summary>
        /// Genera la primera fila de textbox dentro de un gridview.
        /// </summary>
        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));
            dt.Columns.Add(new DataColumn("Column3", typeof(string)));
            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Column1"] = string.Empty;
            dr["Column2"] = string.Empty;
            dr["Column3"] = string.Empty;
            dt.Rows.Add(dr);
            //dr = dt.NewRow();

            //Store the DataTable in ViewState
            ViewState["CurrentTable"] = dt;

            GVmassadd.DataSource = dt;
            GVmassadd.DataBind();
        }
        /// <summary>
        /// Función que agrega una nueva fila en el gridview.
        /// </summary>
        private void AddNewRowToGrid()
        {
            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values
                        TextBox box1 = (TextBox)GVmassadd.Rows[rowIndex].Cells[1].FindControl("txbpalabra");
                        TextBox box2 = (TextBox)GVmassadd.Rows[rowIndex].Cells[2].FindControl("txbpron");
                        TextBox box3 = (TextBox)GVmassadd.Rows[rowIndex].Cells[3].FindControl("txbdefn");

                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;

                        dtCurrentTable.Rows[i - 1]["Column1"] = box1.Text;
                        dtCurrentTable.Rows[i - 1]["Column2"] = box2.Text;
                        dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;

                        rowIndex++;
                    }
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;

                    GVmassadd.DataSource = dtCurrentTable;
                    GVmassadd.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }

            //Set Previous Data on Postbacks
            SetPreviousData();
        }
        /// <summary>
        /// 
        /// </summary>
        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TextBox box1 = (TextBox)GVmassadd.Rows[rowIndex].Cells[1].FindControl("txbpalabra");
                        TextBox box2 = (TextBox)GVmassadd.Rows[rowIndex].Cells[2].FindControl("txbpron");
                        TextBox box3 = (TextBox)GVmassadd.Rows[rowIndex].Cells[3].FindControl("txbdefn");

                        box1.Text = dt.Rows[i]["Column1"].ToString();
                        box2.Text = dt.Rows[i]["Column2"].ToString();
                        box3.Text = dt.Rows[i]["Column3"].ToString();

                        rowIndex++;
                    }
                }
            }
        }
        /// <summary>
        /// Evento que llama a la función que agrega una nueva fila en el gridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButtonAdd_OnClick(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }
        /// <summary>
        /// Bucle que guarda cada fila de textbox, que están dentro del gridview, en la base de datos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Masivo_OnClick(object sender, EventArgs e)
        {
            using (bdchino contexto = new bdchino())
            {
                var npalabra = new PalabrasSuplementaria();
                foreach (GridViewRow row in GVmassadd.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        TextBox word = row.FindControl("txbpalabra") as TextBox;
                        TextBox pron = row.FindControl("txbpron") as TextBox;
                        TextBox defn = row.FindControl("txbdefn") as TextBox;
                        if (word.Text != "")
                        {
                            npalabra.headword = word.Text.Trim();
                        }
                        else if (pron.Text != "")
                        {
                            npalabra.pron = (pron.Text).ToLower().Trim();
                        }
                        else if (defn.Text != "")
                        {
                            npalabra.defn = defn.Text.Trim();
                            var p = contexto.PalabrasSuplementarias.SingleOrDefault(x => x.headword == word.Text);
                            if (p.headword == word.Text && p.pron == pron.Text && p.defn == defn.Text)
                            {
                                ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('La palabra" + word.Text + " introducida ya existe.');", true);
                            }
                            else
                            {
                                contexto.PalabrasSuplementarias.Add(npalabra);
                                //contexto.SaveChanges();
                                _ok = true;
                            }
                        }
                        else
                        {
                            _ok = false;
                        }
                    }
                }
                if (_ok)
                {
                    SetInitialRow();
                    Aviso();
                }
            }
        }
        /// <summary>
        /// Mensaje de aviso de guardado correcto, llamado al guardar en la base de datos
        /// </summary>
        protected void Aviso()
        {
            ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('Se ha guardado correctamente');", true);
        }
        /// <summary>
        /// Reinicio de tabla de la pestaña par agregar varias palabras
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ResetMass_OnClick(object sender, EventArgs e)
        {
            SetInitialRow();
        }
        /// <summary>
        /// Reinicio de textbox de nuevo registro individual
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Reset_1_OnClick(object sender, EventArgs e)
        {
            tbpalabra.Text = "";
            tbpron.Text = "";
            tbdefn.Text = "";
        }
    }
}