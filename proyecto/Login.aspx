<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="proyecto.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/jpg" href="adminLte/dist/img/img.jpg"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
     <!-- Theme style -->
    <link rel="stylesheet" href="adminLte/dist/css/adminlte.min.css"/>
    <title></title>
    <style type="text/css">
        .tarjeta{
            opacity: 0.6;
           }
    </style>
</head>
<body class="hold-transition login-page"  style="background: url(adminLte/dist/img/login.png);
    background-attachment: fixed;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
    ">
        <div class="login-box">
  <div class="image text-center" >
    <img src="adminLte/dist/img/img.png" class="img-circle elevation-2" alt="User Image" width="80px"/>
  </div>
  <div class="login-logo">
    <b>Campeonato</b> 
  </div>
  <!-- /.login-logo -->
  <div class="card tarjeta m-4">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Inicio de Sesión</p>

      <form method="post" runat="server" >
          <div class="form-floating mb-3">
              <asp:TextBox ID="TextBox1" type="text" class="form-control" runat="server" placeholder="Usuario"></asp:TextBox>
          <%--  <input type="text" class="form-control" id="usuario" placeholder="Usuario"/>--%>
            <label for="floatingInput">Usuario</label>         
          </div>
        <div class="form-floating mb-3">
            <asp:TextBox ID="TextBox2" type="text" class="form-control" runat="server" placeholder="Usuario" TextMode="Password"></asp:TextBox>
          <%--<input type="password" class="form-control" id="contra" placeholder="Contraseña"/>--%>
          <label for="floatingInput">Contraseña</label>
        </div>
        <div class="row">       
          <div class="col-12">
            <asp:Button ID="Button1" runat="server" Text="Iniciar" Class="btn btn-primary btn-block" OnClick="Button1_Click1" />
          </div>
            
            <asp:Label ID="Label1" runat="server" Text="Usuario incorrecto" Visible="False"></asp:Label>
             <asp:DropDownList ID="DropDownList1" runat="server" Visible="False"></asp:DropDownList>
        </div>
      </form>
    <!--<br>
       <p class="mb-0">
        <a href="views/Registrarse.php" class="text-center">Registrar Nueva Cuenta</a>
      </p> -->
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

</body>
      <!-- jQuery -->
    <script src="adminLte/plugins/jquery/jquery.min.js"></script>
    <!-- AdminLTE App -->
    <script src="adminLte/dist/js/adminlte.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="adminLte/dist/js/demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</html>
