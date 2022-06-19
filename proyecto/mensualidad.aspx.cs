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
    public partial class mensualidad : System.Web.UI.Page
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

        private void CargarDropDownList()
        {
            string cadena = "select i.id,r.nombre from inscripcion as i left join registro as r on r.id = i.registro_id";
            DataTable dt = new DataTable();
            dt = o.LlenarDatos(cadena).Tables[0];
            this.DropDownList2.DataSource = dt;
            this.DropDownList2.DataTextField = "nombre";
            this.DropDownList2.DataValueField = "id";
            this.DropDownList2.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt = new DataTable();

            if (txtNombreFil.Text != "")
            {
                dt = o.LlenarDatos("select m.id,r.nombre,m.fecha,DATEADD(DAY,30,m.fecha) as proximoPago,i.Mdpago,m.cuota from mensualidad as m left join inscripcion as i on i.id = m.idInscripcion left join registro as r on r.id = i.registro_id where r.nombre like'%" + txtNombreFil.Text + "%' order by r.nombre asc").Tables[0];
            }
            else
            {
                if (txtFechaIniFil.Text != "")
                {
                    dt = o.LlenarDatos("select m.id,r.nombre,m.fecha,DATEADD(DAY,30,m.fecha) as proximoPago,i.Mdpago,m.cuota from mensualidad as m left join inscripcion as i on i.id = m.idInscripcion left join registro as r on r.id = i.registro_id where m.fecha between '" + Convert.ToDateTime(txtFechaIniFil.Text).ToString("yyyy-MM-dd") + "' and '" + Convert.ToDateTime(txtFechaFinFil.Text).ToString("yyyy-MM-dd") + "' order by r.nombre asc").Tables[0];
                }
                else
                {
                    dt = o.LlenarDatos("select m.id,r.nombre,m.fecha,DATEADD(DAY,30,m.fecha) as proximoPago,i.Mdpago,m.cuota from mensualidad as m left join inscripcion as i on i.id = m.idInscripcion left join registro as r on r.id = i.registro_id  order by r.nombre asc").Tables[0];
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        public void refreshdata()
        {

            SqlDataAdapter sda = new SqlDataAdapter();
            DataTable dt1 = new DataTable();
            dt1 = o.LlenarDatos("select m.id,r.nombre,m.fecha,DATEADD(DAY,30,m.fecha) as proximoPago,i.Mdpago,m.cuota from mensualidad as m left join inscripcion as i on i.id = m.idInscripcion left join registro as r on r.id = i.registro_id order by r.nombre asc").Tables[0];
            GridView1.DataSource = dt1;
            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string consulta = "insert into mensualidad values(" + this.DropDownList2.SelectedValue + ",'" + Convert.ToDateTime(fechaPago.Text).ToString("yyyy-MM-dd") + "'," + costo.Text + ")";
            if (o.EjecutarComando(consulta))
            {         
                    costo.Text = "";
                    fechaPago.Text = "";
                    refreshdata();
    
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button btnEditar = sender as Button;
            GridViewRow grow = (GridViewRow)btnEditar.NamingContainer;
            int id = Convert.ToInt32(grow.Cells[0].Text);

            string consulta = "DELETE FROM mensualidad where id = " + id + "";
            if (o.EjecutarComando(consulta))
            {
                refreshdata();
            }
            else
            {
                Label2.Text = "Error fatal";
                Label2.Visible = true;
            }
        }
    }
}