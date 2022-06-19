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
    public partial class usuario : System.Web.UI.Page
    {

        proyecto.Conexion o = new proyecto.Conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
                CargarDropDownList1();
                CargarDropDownList2();
                CargarDropDownList3();
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
            dt = o.LlenarDatos("select u.id_usu,u.usuario,e.nombre,r.nombre as rol from usuario as u left join empleado as e on e.id = u.id_empleado left join usu_roles as ur on ur.id_usuario = u.id_usu left join roles as r on r.id = ur.id_roles").Tables[0];
            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;

        }

        private void CargarDropDownList3()
        {
            string cadena = "select * from roles";
            DataTable dt = new DataTable();
            dt = o.LlenarDatos(cadena).Tables[0];
            this.DropDownList3.DataSource = dt;
            this.DropDownList3.DataTextField = "nombre";
            this.DropDownList3.DataValueField = "id";
            this.DropDownList3.DataBind();

        }
        private void CargarDropDownList1()
        {
            string cadena = "select * from roles";
            DataTable dt = new DataTable();
            dt = o.LlenarDatos(cadena).Tables[0];
            this.DropDownList1.DataSource = dt;
            this.DropDownList1.DataTextField = "nombre";
            this.DropDownList1.DataValueField = "id";
            this.DropDownList1.DataBind();
        }

        private void CargarDropDownList2()
        {
            string cadena = "select e.id,e.nombre,r.nombre as rol from  empleado as e left join usuario as u on u.id_empleado = e.id left join usu_roles as ur on ur.id_usuario = u.id_usu left join roles as r on r.id = ur.id_roles where r.nombre is null";
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
                dt = o.LlenarDatos("select u.id_usu,u.usuario,e.nombre,r.nombre as rol from usuario as u left join empleado as e on e.id = u.id_empleado left join usu_roles as ur on ur.id_usuario = u.id_usu left join roles as r on r.id = ur.id_roles where  e.nombre like '%" + txtNombreFil.Text + "%'").Tables[0];
            }
            else
            {
                dt = o.LlenarDatos("select u.id_usu,u.usuario,e.nombre,r.nombre as rol from usuario as u left join empleado as e on e.id = u.id_empleado left join usu_roles as ur on ur.id_usuario = u.id_usu left join roles as r on r.id = ur.id_roles").Tables[0];
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string consulta = "insert into usuario values('" + user.Text + "','" + contra.Text + "'," + this.DropDownList2.SelectedValue + ")";
            if (o.EjecutarComando(consulta))
            {
                string consulta1 = "select top(1)id_usu from usuario order by id_usu desc";
                DataTable dt = new DataTable();
                dt = o.LlenarDatos(consulta1).Tables[0];
                this.DropDownList4.DataSource = dt;
                this.DropDownList4.DataValueField = "id_usu";
                this.DropDownList4.DataBind();

                string consulta2 = "insert into usu_roles values(" + this.DropDownList4.SelectedValue + "," + this.DropDownList3.SelectedValue + ")";
                if (o.EjecutarComando(consulta2))
                {
                    user.Text = "";
                    contra.Text = "";
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openmodal();", true);
        //}
    }
}