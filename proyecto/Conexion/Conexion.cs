using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace proyecto
{
    public class Conexion
    {
        public SqlConnection Conectar()
        {
            //string cadena = "server=GERARD ; database=proyecto ; integrated security = true";
            string cadena = "Data Source=ELMER-PC;Initial Catalog=gym;Integrated Security=True";
            SqlConnection cone = new SqlConnection(cadena);
            try
            {
                cone.Open();


                return cone;
            }
            catch (Exception ex)
            {
                return cone;
            }

        }

        public void Cerrar(SqlConnection cone)
        {
            cone.Close();
        }

        public int validar(string sql)
        {
            int contador = 0;
            SqlConnection con = this.Conectar();

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                contador++;
            }
            dr.Close();

            return contador;

        }   

        public bool EjecutarComando(string cade)
        {
            SqlConnection con = this.Conectar();

            SqlCommand comando = new SqlCommand(cade, con);

            if (comando.ExecuteNonQuery() > 0)
            {
                this.Cerrar(con);
                return true;
            }
            else
            {
                this.Cerrar(con);
                return false;
            }


        }

        public DataSet LlenarDatos(string cade)
        {
            SqlConnection cone = this.Conectar();
            //TRY
            SqlDataAdapter ada = new SqlDataAdapter(cade, cone);
            DataSet data = new DataSet();
            ada.Fill(data);
            this.Cerrar(cone);
            return data;
        }
    }
}