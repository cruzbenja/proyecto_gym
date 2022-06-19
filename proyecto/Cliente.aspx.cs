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
    public partial class Cliente : System.Web.UI.Page
    {
        proyecto.Conexion o = new proyecto.Conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
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
            dt = o.LlenarDatos("select * from registro order by nombre").Tables[0];

            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string consulta = "insert into registro values('"+nombre.Text+"','"+direccion.Text+"','"+telefono.Text+"','"+ci.Text+"','"+Convert.ToDateTime(fechaNac.Text).ToString("yyyy-MM-dd")+"')";
            if (o.EjecutarComando(consulta))
            {
                nombre.Text = "";
                direccion.Text = "";
                telefono.Text = "";
                ci.Text = "";
                fechaNac.Text = "";
                refreshdata();
            }
            else
            {
                Label1.Text = "Error fatal";
                Label1.Visible = true;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();

            if (txtNombreFil.Text != "")
            {
                dt = o.LlenarDatos("select * from registro where nombre like'%" + txtNombreFil.Text + "%' order by nombre").Tables[0];
            }
            else
            {
                if (txtCarnetFil.Text != "")
                {
                    dt = o.LlenarDatos("select * from registro where ci like '%" + txtCarnetFil.Text + "%' order by nombre").Tables[0];
                }
                else
                {
                    dt = o.LlenarDatos("select * from registro order by nombre").Tables[0];
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["empleado"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}