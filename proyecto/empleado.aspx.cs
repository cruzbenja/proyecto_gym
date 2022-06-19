using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace proyecto
{
    public partial class empleado : System.Web.UI.Page
    {
        proyecto.Conexion o = new proyecto.Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (this.ViewState["nombre"] != null )
                {
                   nombre.Text = (string)this.ViewState["nombre"];
                   direccion.Text = (string)this.ViewState["direccion"];
                   telefono.Text = (string)this.ViewState["telefono"] ;
                   ci.Text = (string)this.ViewState["ci"];
                   fechaNac.Text = (string)this.ViewState["fechaNac"];
                   fechaIng.Text = (string)this.ViewState["fechaIng"];
                   sueldo.Text = (string)this.ViewState["sueldo"];

                   ScriptManager.RegisterStartupScript(Page, Page.GetType(), " myModal ", " $ ('# ModalRegistrarEmpleado'). Modal (); ", true);   
                }
                else
                {
                    refreshdata();
                }
                

            }

            if (Session["empleado"] == "" || Session["empleado"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                LblUsuario.Text = (String)Session["empleado"];
                lblRol.Text = (String)Session["nombreRol"];
                string idRol = (String)Session["idRol"];

                if (idRol == "1")
                {
                    PanelEmpleados.Visible = false;
                    PanelReportes.Visible = false;
                }
                else
                {
                    if (idRol == "2")
                    {
                        PanelEmpleados.Visible = false;
                        PanelClientes.Visible = false;
                        PanelReportes.Visible = false;
                    }

                }
            }
        }

        public void refreshdata()
        {


            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();
            dt = o.LlenarDatos("select * from empleado order by nombre").Tables[0];

            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;

        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
           string nombreCompleto = nombre.Text;
           string direccion1 = direccion.Text;
           string phono = telefono.Text;
           string carnet = ci.Text;
           string nac = fechaNac.Text;
           string ingreso = fechaIng.Text;
           string sueldos = sueldo.Text.Replace(",",".");

           string cadena = "INSERT INTO empleado values('" + nombreCompleto + "','" + direccion1 + "','" + phono + "','" + carnet + "','" + Convert.ToDateTime(nac).ToString("yyyy-MM-dd") + "','" + Convert.ToDateTime(ingreso).ToString("yyyy-MM-dd") + "',"+sueldos+")";

           if (o.EjecutarComando(cadena))
           {
               nombre.Text = "";
               direccion.Text = "";
               telefono.Text = "";
               ci.Text = "";
               fechaNac.Text = "";
               fechaIng.Text = "";
               sueldo.Text = "";
               refreshdata();
           }
           else
           {
               Label1.Text = "Error fatal";
               Label1.Visible = true;
           }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btnEditar = sender as Button;
            GridViewRow grow = (GridViewRow)btnEditar.NamingContainer;
            //string id = GridView1.Rows[0].Cells[1].Text;
            string id = GridView1.Rows[0].Cells[1].Text;
            this.ViewState["nombre"] = grow.Cells[2].Text;
            this.ViewState["direccion"] = grow.Cells[3].Text;
            this.ViewState["telefono"] = grow.Cells[4].Text;
            this.ViewState["ci"] = grow.Cells[5].Text;
            this.ViewState["fechaNac"] = grow.Cells[6].Text;
            this.ViewState["fechaIng"] = grow.Cells[7].Text;
            this.ViewState["sueldo"] = grow.Cells[8].Text;

            //nombre.Text = grow.Cells[1].Text;
            //direccion.Text = grow.Cells[2].Text;
            //telefono.Text = grow.Cells[3].Text;
            //ci.Text = grow.Cells[4].Text;
            //fechaNac.Text = grow.Cells[5].Text;
            //fechaIng.Text = grow.Cells[6].Text;
            //sueldo.Text = grow.Cells[7].Text;

            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), " myModal ", " $ ('# ModalRegistrarEmpleado'). Modal (); ", true);   
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();

            if (txtNombreFil.Text != "")
            {
                dt = o.LlenarDatos("select * from empleado where nombre like'%" + txtNombreFil.Text + "%' order by nombre").Tables[0];
            }
            else
            {
                if (txtCarnetFil.Text != "")
                {
                    dt = o.LlenarDatos("select * from empleado where ci like '%" + txtCarnetFil.Text + "%' order by nombre").Tables[0];
                }
                else
                {
                    dt = o.LlenarDatos("select * from empleado order by nombre").Tables[0];
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["empleado"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}