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
    public partial class inscripcion : System.Web.UI.Page
    {
        proyecto.Conexion o = new proyecto.Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
                CargarDropDownList();
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
            dt = o.LlenarDatos("select i.id as idInscripcion,i.fecha_ing,r.nombre,r.ci,i.costo,i.Mdpago,r.telefono from inscripcion as i left join registro as r on r.id = i.registro_id").Tables[0];

            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();

            if (txtNombreFil.Text != "")
            {
                dt = o.LlenarDatos("select i.id as idInscripcion,i.fecha_ing,r.nombre,r.ci,i.costo,i.Mdpago,r.telefono from inscripcion as i left join registro as r on r.id = i.registro_id where r.nombre like'%" + txtNombreFil.Text + "%' order by r.nombre asc").Tables[0];
            }
            else
            {
                if (txtCarnetFil.Text != "")
                {
                    dt = o.LlenarDatos("select i.id as idInscripcion,i.fecha_ing,r.nombre,r.ci,i.costo,i.Mdpago,r.telefono from inscripcion as i left join registro as r on r.id = i.registro_id where r.ci like '%" + txtCarnetFil.Text + "%' order by r.nombre asc").Tables[0];
                }
                else
                {
                    dt = o.LlenarDatos("select i.id as idInscripcion,i.fecha_ing,r.nombre,r.ci,i.costo,i.Mdpago,r.telefono from inscripcion as i left join registro as r on r.id = i.registro_id").Tables[0];
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        private void CargarDropDownList()
        {
            string cadena = "select id,nombre from registro order by nombre asc";
            DataTable dt = new DataTable();
            dt = o.LlenarDatos(cadena).Tables[0];
            this.DropDownList2.DataSource = dt;
            this.DropDownList2.DataTextField = "nombre";
            this.DropDownList2.DataValueField = "id";
            this.DropDownList2.DataBind();  
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string consulta = "insert into inscripcion values(" + this.DropDownList2.SelectedValue + ",'" + Convert.ToDateTime(fechaIng.Text).ToString("yyyy-MM-dd") + "','" + this.DropDownList1.SelectedValue + "'," + costo.Text + ")";
            if (o.EjecutarComando(consulta))
            {
                string consulta1 = "select top(1)id from inscripcion order by id desc";
                DataTable dt = new DataTable();
                dt = o.LlenarDatos(consulta1).Tables[0];
                this.DropDownList3.DataSource = dt;
                this.DropDownList3.DataValueField = "id";
                this.DropDownList3.DataBind();  

                string consulta2 = "insert into mensualidad values(" + this.DropDownList3.SelectedValue + ",'" + Convert.ToDateTime(fechaIng.Text).ToString("yyyy-MM-dd") + "'," + costo.Text + ")";
                if (o.EjecutarComando(consulta2))
                {
                    costo.Text = "";
                    fechaIng.Text = "";
                    refreshdata();
                }
               
            }
            else
            {
                Label1.Text = "Error fatal";
                Label1.Visible = true;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session["empleado"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}