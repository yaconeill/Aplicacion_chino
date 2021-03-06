﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiccionarioChino
{
    public partial class Palabras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDTema.Visible = false;
                using (bdchino contexto = new bdchino())
                {
                    try
                    {
                        var fuente = (from f in contexto.Fuentes
                                      where (f.Id >= 1 && f.Id <= 2)
                                      orderby f.Id
                                      select f).ToList();
                        DDfuente.DataSource = fuente;
                        DDfuente.DataTextField = "Fuente1";
                        DDfuente.DataValueField = "Id";
                        DDfuente.DataBind();
                    }
                    catch (Exception)
                    {
                        var mensaje = "No se ha podido conectar con la base de datos.";
                        ClientScript.RegisterStartupScript(GetType(), "Aviso", "alert('" + mensaje + "');", true);
                    }
                    //Add blank item at index 0.
                    DDfuente.Items.Insert(0, new ListItem("--Seleccionar libro--", "0"));
                }
            }
        }

        protected void DDfuente_OnLoad(object sender, EventArgs e)
        {
            var id = Convert.ToInt32(DDfuente.SelectedItem.Value);
            if (id == 0)
            {
                DDTema.Visible = false;
            }
            else
            {
                DDTema.Visible = true;
            }
            using (bdchino contexto = new bdchino())
            {
                var temas = (from t in contexto.Temas
                             join ft in contexto.FuenteTemas
                             on t.Id equals ft.IdTema
                             where ft.IdFuente == id
                             select t).ToList();
                DDTema.DataSource = temas;
                DDTema.DataTextField = "Temas";
                DDTema.DataValueField = "Id";
                DDTema.DataBind();
            }
            //Add blank item at index 0.
            DDTema.Items.Insert(0, new ListItem("--Seleccionar tema--", "0"));
        }

        protected void DDTema_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var tema = Convert.ToInt32(DDTema.SelectedItem.Value);
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
                GVpalabras.DataSource = palabras;
                GVpalabras.DataBind();
            }
        }

        //protected void GVpalabras_OnRowCreated(object sender, GridViewRowEventArgs e)
        //{
        //    //string c1 = "";
        //    //string c2 = "";
        //    //string c3 = "";
        //    string js = null;
        //    foreach (GridViewRow gridViewRow in GVpalabras.Rows)
        //    {
        //        string c1 = GVpalabras.Rows[gridViewRow.RowIndex].Cells[0].Text;
        //        string c2 = GVpalabras.Rows[gridViewRow.RowIndex].Cells[1].Text;
        //        string c3 = GVpalabras.Rows[gridViewRow.RowIndex].Cells[2].Text;
        //        js = "carga_palabras('" + c1 + "','" + c2 + "','" + c3 + "');";
        //        break;
        //    }
        //    LinkButton myLinkButton = (LinkButton)e.Row.FindControl("link");
        //    //string js = "carga_palabras('" + c1 + "','" + c2 + "','" + c3 + "');";
        //    if (myLinkButton != null)
        //    {
        //        myLinkButton.Attributes.Add("onclick", js);
        //    }
        //}
        protected void GVpalabras_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            int n = Convert.ToInt32(e.CommandArgument);
            Session["muestra"] = GVpalabras.Rows[n].Cells[3].Text;
            Session["comando"] = "pl";
            //Response.Write("<script>window.open('Detalle.aspx','_blank');</script>");
            Response.Write("<script>window.open('Detalle.aspx', 'Timetable', 'width=557,height=347,toolbar=false, menubar=false, scrollbars=false, directories=false, resizable=false');</script>");
        }
    }
}
