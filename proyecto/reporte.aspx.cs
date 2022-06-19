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
    public partial class reporte : System.Web.UI.Page
    {
        proyecto.Conexion o = new proyecto.Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdataTotalIncritos();
                refreshdataTotalClientes();
                refreshdataIngresosMensuales();
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

        public void refreshdataTotalClientes()
        {
            string consulta1 = "select count(id) as total from registro";
            DataTable dt1 = new DataTable();
            dt1 = o.LlenarDatos(consulta1).Tables[0];
            string total = dt1.Rows[0][0].ToString();

            LblTotalClientes.Text = total + " Clientes.";

            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();
            dt = o.LlenarDatos("select nombre,telefono,fechanac from registro order by nombre asc").Tables[0];



            GridView3.DataSource = dt;
            GridView3.DataBind();

            GridView3.UseAccessibleHeader = true;
            GridView3.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView3.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        public void refreshdataIngresosMensuales()
        {
            string consulta1 = "select sum(costo) as total from inscripcion";
            DataTable dt1 = new DataTable();
            dt1 = o.LlenarDatos(consulta1).Tables[0];
            string total = dt1.Rows[0][0].ToString();

            LblTotalIngresos.Text = total + " Bs.";

            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();
            dt = o.LlenarDatos("select r.nombre,i.costo,i.Mdpago from inscripcion as i left join registro as r on r.id = i.registro_id order by r.nombre asc").Tables[0];



            GridView2.DataSource = dt;
            GridView2.DataBind();

            GridView2.UseAccessibleHeader = true;
            GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView2.FooterRow.TableSection = TableRowSection.TableFooter;
        }


        public void refreshdataTotalIncritos()
        {
            string consulta1 = "select count(id) as total from inscripcion";
            DataTable dt1 = new DataTable();
            dt1 = o.LlenarDatos(consulta1).Tables[0];
            string total = dt1.Rows[0][0].ToString();

            LblTotalInscritos.Text = total + " Inscritos.";

            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();
            dt = o.LlenarDatos("select r.nombre,r.telefono,i.fecha_ing,i.Mdpago from inscripcion as i left join registro as r on r.id = i.registro_id order by r.nombre asc").Tables[0];



            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["empleado"] = null;
            Response.Redirect("Login.aspx");
        }

     
    }
}