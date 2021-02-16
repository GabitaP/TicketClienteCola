using ProcesamientoColasDB;
using ProcesamientoColasNegocio;
using System;

namespace SisProcesamientoColas
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Carga inicial de registros de cola
                CargarGridCola1();
                CargarGridCola2();
            }
        }

        //Consulta de registros Cola 1
        public void CargarGridCola1()
        {
            try
            {
                int id_cola = 1;
                var datos = BProcesamientoColas.GetColaID(id_cola);
                grv_Cola1.DataSource = datos;
                grv_Cola1.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Consulta de registros Cola2
        public void CargarGridCola2()
        {
            try
            {
                int id_cola = 2;
                var datos = BProcesamientoColas.GetColaID(id_cola);
                grv_Cola2.DataSource = datos;
                grv_Cola2.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Insertar nuevo cliente pendiente de atención
        protected void NewProces_Click(object sender, EventArgs e)
        {
            try
            {
                PROCESAMIENTO_COLA newClient = new PROCESAMIENTO_COLA();
                var datos1 = BProcesamientoColas.Insert_NewCliente(IdCliente.Text,NomCliente.Text);
                CargarGridCola1();
                CargarGridCola2();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Control de timer y actualización
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                int seconds = int.Parse(lblTimerTime1.Text);
                if (seconds > 0)
                    lblTimerTime1.Text = (seconds - 1).ToString();
                else
                {
                    PROCESAMIENTO_COLA newClient = new PROCESAMIENTO_COLA();
                    var datos1 = BProcesamientoColas.Actualizar_Cola(1);
                    lblTimerTime1.Text = "120";
                }

                int seconds2 = int.Parse(lblTimerTime2.Text);
                if (seconds2 > 0)
                    lblTimerTime2.Text = (seconds2 - 1).ToString();
                else
                {
                    PROCESAMIENTO_COLA newClient = new PROCESAMIENTO_COLA();
                    var datos1 = BProcesamientoColas.Actualizar_Cola(2);
                    lblTimerTime2.Text = "180";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}