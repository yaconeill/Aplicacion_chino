using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class PSuplementarias : System.Web.UI.Page
    {
        private int sk;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sk = 0;
                using (bdchino contexto = new bdchino())
                {
                    try
                    {
                        var suple = (from s in contexto.PalabrasSuplementarias
                                     orderby s.Id
                                     select s).Skip(sk).Take(10).ToList();
                        GVsuplementarias.DataSource = suple;
                        GVsuplementarias.DataBind();
                        Session["size"] = contexto.PalabrasSuplementarias.Count() - 1;
                    }
                    catch (Exception)
                    {
                        var mensaje = "No se ha podido conectar con la base de datos.";
                        ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('" + mensaje + "');", true);
                    }
                }
            }
            else
            {
                //Rellena();
            }
        }

        private void Rellena()
        {
            //int size = Convert.ToInt32(Session["size"]);
            string size = Session["size"].ToString();
            sk = Convert.ToInt32(Session["sk"]);
            if (sk <= 0)
            {
                sk = 0;
            }
            else if (sk >= Convert.ToInt32(size))
            {
                var prp = size.Substring(size.Length - 1,1);
                if (Convert.ToInt32(prp) < 10)
                {
                    sk = Convert.ToInt32(size) - Convert.ToInt32(prp);
                    Session["sk"] = sk;
                }
                //if (!size.EndsWith("0"))
                //{
                //    sk = Convert.ToInt32(size) - 10;
                //    Session["sk"] = sk;
                //}
            }
            using (bdchino contexto = new bdchino())
            {
                try
                {
                    var suple = (from s in contexto.PalabrasSuplementarias
                                 orderby s.Id
                                 select s).Skip(sk).Take(10).ToList();
                    GVsuplementarias.DataSource = suple;
                    GVsuplementarias.DataBind();
                }
                catch (Exception)
                {
                    var mensaje = "No se ha podido conectar con la base de datos.";
                    ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('" + mensaje + "');", true);
                }
            }
        }

        protected void GVsuplementarias_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            int n = Convert.ToInt32(e.CommandArgument);
            Session["muestra"] = GVsuplementarias.Rows[n].Cells[3].Text;
            Session["comando"] = "ps";
            //Response.Write("<script>window.open('Detalle.aspx','_blank');</script>");
            Response.Write("<script>window.open('Detalle.aspx', 'Timetable', 'width=557,height=347,toolbar=false, menubar=false, scrollbars=false, directories=false, resizable=false');</script>");
        }

        protected void primero_OnClick(object sender, EventArgs e)
        {
            sk = Convert.ToInt32(Session["sk"]);
            sk = 0;
            Session["sk"] = sk;
            Rellena();
        }

        protected void anterior_OnClick(object sender, EventArgs e)
        {
            sk = Convert.ToInt32(Session["sk"]);
            sk -= 10;
            Session["sk"] = sk;
            Rellena();
        }

        protected void siguiente_OnClick(object sender, EventArgs e)
        {
            sk = Convert.ToInt32(Session["sk"]);
            sk += 10;
            Session["sk"] = sk;
            Rellena();
        }

        protected void ultimo_OnClick(object sender, EventArgs e)
        {
            Session["sk"] = Session["size"];
            Rellena();
        }
    }
}