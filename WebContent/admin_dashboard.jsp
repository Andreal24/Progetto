<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link rel="icon" type="image/png" href="img/index.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!-- CSS Files -->
    <link href="dashboard/css/bootstrap.min.css" rel="stylesheet" />
    <link href="dashboard/css/light-bootstrap-dashboard.css?v=2.0.1" rel="stylesheet" />

</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-color="red" data-image="dashboard/img/sidebar-7.jpg">

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="index.jsp" class="simple-text">
                        <img src="img/logo_wine_white.png" width=110px; height=32px;>
                    </a>
                </div>
                <ul class="nav">
                    <li  class="nav-item active">
                        <a class="nav-link" href="admin_dashboard.jsp">
                            <p>Admin</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="dashboard/pages/admin_prodotti.jsp">
                            <p>Prodotti</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="dashboard/pages/admin_utenti.jsp">
                            <p>Utenti</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class=" container-fluid  ">
                    <a class="navbar-brand" href="#Dashboard"> Dashboard </a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#User">
                                    <span class="no-icon"> <%if(session.getAttribute("ID")==null) {}%><%=session.getAttribute("ID") %> </span>
                                </a>
                            </li>
                            <li class="nav-item">
                            <form class="logout" method="post" action="logout">                         
                                <a class="nav-link" href="index.jsp" target="_self">
                                    <div onClick="return confirm('Sei sicuro di voler effettuare il logout?')">
                                    <span class="no-icon">Log out</span></div></a></form></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div style="width: 100%; height: 100%; top: 0; left: 0; overflow: hidden;"><img src="img/admin-dash.jpg"></div>
                                
            <footer class="footer">
                <div class="container">
                    <nav>
                        <p class="copyright text-center">
                            Copyright
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="index.jsp">e-Wine</a>
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
</body>

<!--   Core JS Files   -->
<script src="dashboard/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="dashboard/js/core/popper.min.js" type="text/javascript"></script>
<script src="dashboard/js/core/bootstrap.min.js" type="text/javascript"></script>

<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="dashboard/js/plugins/bootstrap-switch.js"></script>

<!--  Chartist Plugin  -->
<script src="dashboard/js/plugins/chartist.min.js"></script>

<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="dashboard/js/light-bootstrap-dashboard.js?v=2.0.1" type="text/javascript"></script>

</html>