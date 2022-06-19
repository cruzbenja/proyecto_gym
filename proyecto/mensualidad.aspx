<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mensualidad.aspx.cs" Inherits="proyecto.mensualidad" %>

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
   
    <title>Mensualidad</title>

     <style>
        .card {
            border-top-color: cornflowerblue;
            border-top-width: 3px;
        }
    </style>
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
        <div class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-9">
                <h1 class="m-0">Mensualidades</h1>             
              </div>
              <div class="col-12 col-md-3 text-right">
                 <%-- <asp:Button ID="Button1" type="button" class="btn btn-primary btn-block" runat="server" Text="Nuevo Cliente" OnClick="Button1_Click" />--%>
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalRegistrarCliente"><i class="fas fa-plus-circle"></i> Nuevo Pago</button>                   
              </div>     
            </div><!-- /.row -->
          </div><!-- /.container-fluid -->
        </div>

         <section class="col-lg-12 col-md-12">
                    <div id="accordion">
                        <div class="card info-box shadow-lg">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Filtros
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseOne" class="hide collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                   
                                        <div class="box-body">
                                            <div class="form-horizontal">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label for="inputCasa" class="form-label"><b>Nombre</b></label>
                                                            <asp:TextBox type="text" class="form-control" ID ="txtNombreFil" placeholder="Ingresar nombre" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                     <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label for="inputCasa" class="form-label"><b>Fecha Inicio</b></label>
                                                            <asp:TextBox type="date" class="form-control" ID ="txtFechaIniFil" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                     <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label for="inputCasa" class="form-label"><b>Fecha Fin</b></label>
                                                            <asp:TextBox type="date" class="form-control" ID ="txtFechaFinFil"  runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div style="margin-top:32px;">
                                                            <asp:Button ID="btnFiltrar" runat="server" type="button" class="btn btn-primary btn-block" Text="Filtrar" OnClick="btnFiltrar_Click" />
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
       <br />


        <section class="col-lg-12 col-md-12">
            <div class="card info-box shadow-lg">   
              <div class="card-body">
                   <h4>Lista de Pagos</h4>
                    <br />
                   <div id="contenerdor_tabla" class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" Width="100%" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="#" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="fecha" HeaderText="Fecha Pago" />
                            <asp:BoundField DataField="proximoPago" HeaderText="Proximo Pago" />
                            <asp:BoundField DataField="Mdpago" HeaderText="Metodo Pago" />
                            <asp:BoundField DataField="cuota" HeaderText="Mensualidad" />
                             <asp:TemplateField HeaderText="Acción">
                                <ItemTemplate>
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#ModalEliminarEmpleado"><i class="fas fa-trash">
                                    <%--<asp:Button ID="Button2" runat="server" Text="Button" type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalRegistrarEmpleado"/>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                      </asp:GridView>
                  </div>
              </div>
              <!-- /.card-body -->
            </div>
            <br>
        </section>


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
              <h4 class="modal-title"> Nuevo Pago</h4>
              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                     
                        <label for="inputName" class="form-label"><b>Nombre</b></label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                             <asp:DropDownList ID="DropDownList2" class="form-control shadow-lg" runat="server">
               
                            </asp:DropDownList>                    
                        </div>                 
                    </div>       
                    <div class="col-md-6">
                      <br>
                        <label for="inputName" class="form-label"><b>Mensualidad</b></label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                            </div>
                             <asp:TextBox type="text" class="form-control shadow-lg" ID ="costo" placeholder="Ingresar mensualidad" runat="server"></asp:TextBox>
                                                    
                        </div>                 
                    </div>               
                    <div class="col-md-6">
                    <br>
                        <label for="inputName" class="form-label"><b>Fecha Pago</b></label>
                        <div class="input-group">                 
                             <asp:TextBox type="date" class="form-control shadow-lg" ID ="fechaPago" runat="server"></asp:TextBox>
                                              
                        </div>                 
                    </div>
                                  
                <div class="col-md-6">  
                    <asp:TextBox type="text" class="form-control" ID ="txtId" runat="server" Visible="False"></asp:TextBox>             
                   
                </div> 
              <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    
                    <br>
                </div> 
            </div>
            <div class="modal-footer col-md-12">            
                <asp:Button ID="btnGuardar" runat="server"  class="btn btn-primary" Text="Guardar" OnClick="btnGuardar_Click" />
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>            
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
      <!-- /.modal -->

               <!-- Modal nuevo/editar equipo --> 
    <div class="modal fade" id="ModalEliminarEmpleado" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Confirmación</h4>
              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                     
                        <label for="inputName" class="form-label">¿Seguro que desea eliminar la inscripción?</label>          
                    </div>       
                          
 
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                   
                 
                </div> 
            </div>
            <div class="modal-footer col-md-12">            
                <asp:Button ID="Button3" runat="server"  class="btn btn-primary" Text="Eliminar" OnClick="Button3_Click" />
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>            
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


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
