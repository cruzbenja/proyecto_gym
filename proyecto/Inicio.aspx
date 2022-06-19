<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="proyecto.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/jpg" href="adminLte/dist/img/img.jpg"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
     <!-- Theme style -->
    <link rel="stylesheet" href="adminLte/dist/css/adminlte.min.css"/>
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="adminLte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
      <!-- Font Awesome -->
    <link rel="stylesheet" href="adminLte/plugins/fontawesome-free/css/all.min.css"/>
    <title></title>
</head>
<body class="hold-transition sidebar-mini layout-fixed sidebar-closed sidebar-collapse">
    <form id="form1" runat="server">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
      
            </ul>
      
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
              
                <li class="nav-item">
                    <a class="nav-link" href="#" role="button">
                        <asp:Label ID="lblRol" class="form-label" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                    </a>
                </li>
            
                <li class="nav-item">
                    <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                        <i class="fas fa-expand-arrows-alt"></i>
                    </a>
                </li>
                 <li class="nav-item">
                    <asp:Button ID="btnSalir" runat="server" type="button" class="btn btn-white" Text="Cerrar Sesión" OnClick="btnSalir_Click" />         
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

          <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="Inicio.aspx" class="brand-link">
                <img src="adminLte/dist/img/img.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"/>
                <span class="brand-text font-weight-light">GYM MUSCULIN</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="adminLte/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image"/>
                    </div>
                    <div class="info">
                        <asp:Label ID="LblUsuario" class="form-label text-white" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

           
                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->  
                        <asp:Panel ID="PanelDashboard" runat="server">           
                        <li class="nav-item menu-open">
                            <a href="Inicio.aspx" class="nav-link active">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                   
                                    Dashboard                             
                                </p>
                            </a>     
                        </li>
                         </asp:Panel>  
                         <asp:Panel ID="PanelClientes" runat="server">
                         <li class="nav-item">
                            <a href="Cliente.aspx" class="nav-link">
                                <i class="nav-icon fas fa-user-plus"></i>
                                <p>
                                    Clientes
                                    <span class="right badge badge-danger">New</span>
                                </p>
                            </a>
                        </li>
                         </asp:Panel>  
                         <asp:Panel ID="PanelInscripcion" runat="server">
                         <li class="nav-item">
                            <a href="inscripcion.aspx" class="nav-link">
                                <i class="nav-icon fas fa-address-book"></i>
                                <p>
                                    Inscripción                              
                                </p>
                            </a>
                        </li>
                          </asp:Panel>  
                         <asp:Panel ID="PanelMensualidad" runat="server">
                         <li class="nav-item">
                            <a href="mensualidad.aspx" class="nav-link">
                                <i class="nav-icon fas fa-cash-register"></i>
                                <p>
                                    Cobro Mensualidad                              
                                </p>
                            </a>
                        </li>
                         </asp:Panel>  
                         <asp:Panel ID="PanelEmpleados" runat="server">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-users"></i>
                                <p>
                                    Empleados
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="empleado.aspx" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Nuevo Empleado</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="usuario.aspx" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Usuarios</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                              <li class="nav-item">
                            <a href="reporte.aspx" class="nav-link">
                                <i class="nav-icon fas fa-chart-bar"></i>
                                <p>
                                    Reporte                             
                                </p>
                            </a>
                        </li>
                       </asp:Panel>  

                        <asp:Panel ID="PanelReportes" runat="server">
                         <li class="nav-item">
                            <a href="reporte.aspx" class="nav-link">
                                <i class="nav-icon fas fa-chart-bar"></i>
                                <p>
                                    Reporte                             
                                </p>
                            </a>
                        </li>
                         </asp:Panel> 
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>
    </div>
   <div class="content-wrapper">
    <!-- Content Header (Page header) -->
      

     


      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
          <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
      </div>

           <?php $año = date('Y'); ?>
        <footer class="main-footer">
            <div class="float-right d-none d-sm-block">
            <b>Version</b> 1.0
            </div>
            <strong>Copyright &copy; Software Bolivia <?php echo $año ?></strong> Todos los derechos reservados.
        </footer>
    
    </div>
    <!-- ./wrapper -->


     <!-- Modal nuevo/editar equipo --> 
    <div class="modal fade" id="ModalRegistrarCliente">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="tituloJugador"><i class="nav-icon fas fa-users"></i> Nuevo Equipo</h4>
              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 text-center">
                      <br>
                        <label for="inputName" class="form-label"><b>Nombre</b></label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-users"></i></span>
                            </div>
                            <input type="text" class="form-control" id ="nombre" placeholder="Ingresar Nombre" />                          
                        </div>                 
                    </div>       
                    <div class="col-md-12">
                      <br>
                        <label for="inputName" class="form-label"><b>Apellido Paterno</b></label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-users"></i></span>
                            </div>
                            <input type="text" class="form-control" id ="paterno" placeholder="Ingresar Apellido Paterno" />                          
                        </div>                 
                    </div>   
                    <div class="col-md-12">
                      <br>
                        <label for="inputName" class="form-label"><b>Apellido Materno</b></label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-users"></i></span>
                            </div>
                            <input type="text" class="form-control" id ="materno" placeholder="Ingresar Apellido Materno" />                          
                        </div>                 
                    </div>  
                    <div class="col-md-6">
                      <br>
                        <label for="inputName" class="form-label"><b>Carnet</b></label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-users"></i></span>
                            </div>
                            <input type="text" class="form-control" id ="ci" placeholder="Ingresar Carnet" />                          
                        </div>                 
                    </div>          
                   
                    <div class="col-md-6">
                      <br>
                        <label for="inputName" class="form-label"><b>Sexo</b></label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-users"></i></span>
                            </div>
                            <select class="form-control">

                                <option>Masculino</option>
                                <option>Femenino</option>
                            </select>                    
                        </div>                 
                    </div>          
                    <div class="col-md-6">
                    <br>
                        <label for="inputName" class="form-label"><b>Fecha Nacimiento</b></label>
                        <div class="input-group">                 
                            <input type="date" class="form-control" id ="fecha">                          
                        </div>                 
                    </div>
                                                    
                <div class="col-md-6">               
                    <input type="hidden" class="form-control" id ="id">                                          
                </div> 
              <br>
                    <div id="cargando_add"></div>
                    <br>
                </div> 
            </div>
            <div class="modal-footer col-md-12">
              <div id="botonRegistro"></div>
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>            
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
      <!-- /.modal -->
    </form>
</body>
     <!-- jQuery -->
    <script src="adminLte/plugins/jquery/jquery.min.js"></script>
      <!-- overlayScrollbars -->
    <script src="adminLte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="adminLte/dist/js/adminlte.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="adminLte/dist/js/demo.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="adminLte/dist/js/pages/dashboard.js"></script>
     <!-- Bootstrap 5 -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</html>
