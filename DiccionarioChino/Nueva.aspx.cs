using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Nueva : System.Web.UI.Page
    {
        private bool _ok;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialRow();
            }
        }

        protected void OnClick(object sender, EventArgs e)
        {
            using (bdchino contexto = new bdchino())
            {
                var npalabra = new PalabrasSuplementaria();
                npalabra.headword = tbpalabra.Text;
                npalabra.pron = (tbpron.Text).ToLower();
                npalabra.defn = tbdefn.Text;
                if (npalabra.headword != "" && npalabra.pron != "" && npalabra.defn != "")
                {
                    contexto.PalabrasSuplementarias.Add(npalabra);
                    contexto.SaveChanges();
                    tbpalabra.Text = "";
                    tbpron.Text = "";
                    tbdefn.Text = "";
                    Aviso(); 
                }
            }
        }
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

        protected void ButtonAdd_OnClick(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

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
                        TextBox defn= row.FindControl("txbdefn") as TextBox;
                        if (word.Text != "")
                        {
                            npalabra.headword = word.Text;
                        }
                        if (pron.Text != "")
                        {
                            npalabra.pron = (pron.Text).ToLower();
                        }
                        if (defn.Text != "")
                        {
                            npalabra.defn = defn.Text;
                            //contexto.PalabrasSuplementarias.Add(npalabra);
                            //contexto.SaveChanges();
                            _ok = true;
                        }
                        else
                        {
                            _ok = false;
                        }
                    }
                }
                if (!_ok) return;
                SetInitialRow();
                Aviso();
            }
        }

        protected void Aviso()
        {
            ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('Se ha guardado correctamente');", true);
        }

        protected void ResetMass_OnClick(object sender, EventArgs e)
        {
            SetInitialRow();
        }

        protected void Reset_1_OnClick(object sender, EventArgs e)
        {
            tbpalabra.Text = "";
            tbpron.Text = "";
            tbdefn.Text = "";
        }
    }
}