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
    public partial class Login : System.Web.UI.Page
    {
        Conexion o = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            string usuario = TextBox1.Text;
            string contra = TextBox2.Text;
            string consulta = "select e.id,e.nombre,u.usuario,u.contraseña,r.id as idRol,r.nombre as rol from  empleado as e left join usuario as u on u.id_empleado = e.id left join usu_roles as ur on ur.id_usuario = u.id_usu left join roles as r on r.id = ur.id_roles where usuario = '" + usuario + "' and contraseña = '" + contra + "'";



            if (o.validar(consulta)> 0)
            {
               
                DataTable dt = new DataTable();
                dt = o.LlenarDatos(consulta).Tables[0];
                Session["idRol"] = dt.Rows[0][4].ToString();
                Session["usuario"] = usuario;
                Session["nombreRol"] = dt.Rows[0][5].ToString();
                Session["empleado"] = dt.Rows[0][1].ToString();
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                Label1.Visible = true;
            }
         //   Response.Redirect("Inicio.aspx");
        }
    }
}