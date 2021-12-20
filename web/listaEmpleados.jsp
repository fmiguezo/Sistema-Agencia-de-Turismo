<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, java.util.Date, Logica.Controladora, Logica.Empleado, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Agencia Skydash - Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
    <%HttpSession misession = request.getSession();
    String usuario = (String) misession.getAttribute("usuario");
        if (usuario == null){
            response.sendRedirect("login.jsp");
        } 
    %>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="index.jsp"><img src="images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Búsqueda" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-success">
                    <i class="ti-info-alt mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-warning">
                    <i class="ti-settings mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Configuración</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Mensaje Privado
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Registro de nuevo usuario</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown"> 
            <a class="nav-link dropdown-toggle" href="#updatepassword" data-toggle="dropdown" id="profileDropdown">
              <form id="form-logout" action="SvModificarUsu" method="POST">
                    <input type="hidden" name="nombre_usuario" value="<%=usuario%>">
                    <button type="submit" class="btn btn-inverse-primary btn-fw"><i class="ti-reload btn-icon-prepend"></i> Cambiar contraseña</button>
              </form>
            </a>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <form id="form-logout" action="SvLogout" method="GET">
                    <input type="hidden" name="logout" value="true">
                    <button type="submit" class="btn btn-inverse-primary btn-fw"><i class="ti-power-off btn-icon-prepend"></i> Cerrar sesión</button>
              </form>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">MODO VISTA</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Claro</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Oscuro</div>
          <p class="settings-heading mt-2">COLOR ENCABEZADO</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#servicios" aria-expanded="false" aria-controls="servicios">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">Servicios</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="servicios">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaServicios.jsp">Alta de servicios</a></li>
                <form action="SvConsultaSer" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaSer">Lista de servicios </a></li>
                </form>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#paquetes" aria-expanded="false" aria-controls="paquetes">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Paquetes</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="paquetes">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaPaquetes.jsp">Alta de paquetes</a></li>
                <form action="SvConsultaPaq" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaPaq">Lista de paquetes</a></li>
                </form>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ventas" aria-expanded="false" aria-controls="ventas">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">Ventas</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ventas">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaVentasSer.jsp">Vender servicio</a></li>
                <li class="nav-item"> <a class="nav-link" href="altaVentasPaq.jsp">Vender paquete</a></li>
                <form action="SvConsultaVen" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaVen">Lista de ventas</a></li>
                </form>
              </ul>
            </div>
          </li>   
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#empleados" aria-expanded="false" aria-controls="empleados">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Empleados</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="empleados">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaEmpleados.jsp"> Alta de empleados </a></li>
                <form action="SvConsultaEm" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaEm"> Lista de empleados </a></li>
                </form>
              </ul>
            </div>
          </li>
        
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#clientes" aria-expanded="false" aria-controls="clientes">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Clientes</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="clientes">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaClientes.jsp"> Alta de clientes </a></li>
                <form action="SvConsultaCl" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaCl"> Lista de clientes </a></li>
                </form>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Lista de Empleados</h4>
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>
                            Id
                          </th>
                          <th>
                            Nombre
                          </th>
                          <th>
                            Apellido
                          </th>
                          <th>
                            Dirección
                          </th>
                          <th>
                            DNI
                          </th>
                          <th>
                            Fecha de Nacimiento
                          </th>
                          <th>
                            Nacionalidad
                          </th>
                          <th>
                            Celular
                          </th>
                          <th>
                            Email
                          </th>
                          <th>
                            Cargo
                          </th>
                          <th>
                            Sueldo
                          </th>
                          <th>
                            Editar
                          </th>
                          <th>
                            Eliminar
                          </th>
                        </tr>
                      </thead>
         
                      <tbody>
                        <% SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); 
                           Controladora control = new Controladora(); // llamo controladora
                           List<Empleado> listaEmpleados = (List) request.getSession().getAttribute("listaEmpleados");
                           for (Empleado emple : listaEmpleados) {
                        %>
                        <tr>
                        <%int id = emple.getId();
                        String nombre = emple.getNombre();
                        String apellido = emple.getApellido();
                        String direccion = emple.getDireccion();
                        String dni = emple.getDni();
                        Date fecha_nac = emple.getFecha_nac();
                        String strDate = formatter.format(fecha_nac);
                        String nac = emple.getNacionalidad();
                        String cel = emple.getCelular();
                        String mail = emple.getEmail();
                        String cargo = emple.getCargo();
                        double sueldo = emple.getSueldo();
                        %>
                          <td class="py-1">
                            <%=id%>
                          </td>
                          <td>
                            <%=nombre%>
                          </td>
                          <td>
                            <%=apellido%>
                          </td>
                          <td>
                            <%=direccion%>
                          </td>
                          <td>
                            <%=dni%>
                          </td>
                          <td>
                            <%=strDate%>
                          </td>
                          <td>
                            <%=nac%>
                          </td>
                          <td>
                            <%=cel%>
                          </td>
                          <td>
                            <%=mail%>
                          </td>
                          <td>
                            <%=cargo%>
                          </td>
                          <td>
                            <%=sueldo%>
                          </td>
                          <td>
                            <form name="frmModificarEmpleado" action="SvModificarEm" method="post">
                            <input type="hidden" name="id" value="<%=id%>">
                            <button type="submit" class="btn btn-outline-warning btn-icon-text"><i class="ti-reload btn-icon-prepend"></i>Editar</button>
                            </form>
                          </td>
                          <td>
                            <form name="frmEliminarEmpleado" action="SvEliminarEm" method="post">
                            <input type="hidden" name="id" value="<%=id%>">
                            <button type="submit" class="btn btn-outline-danger btn-icon-text"><i class="ti-alert btn-icon-prepend"></i>Eliminar</button>
                            </form>
                          </td>
                          <%}%>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Sitio web elaborado con <i class="ti-heart text-danger ml-1"></i> por <a href="https://github.com/florfmo" target="_blank">Florencia Miguez</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
          </div>
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed by <a href="https://www.themewagon.com/" target="_blank">Themewagon</a></span> 
          </div>
        </footer> 
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>

