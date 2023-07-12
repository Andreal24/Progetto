<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
        <link rel="shortcut icon" type="image/png" href="img/index.png"/>
        <title>eWine - enoteca online</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/flexslider.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/line-icons.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/elegant-icons.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/lightbox.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/theme-1.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/showcase.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/ecommerce.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/assets/style_basket.css" rel="stylesheet" type="text/css" media="all"/>
        <!--[if gte IE 9]>
        	<link rel="stylesheet" type="text/css" href="css/ie9.css" />
		<![endif]-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,400,300,600,700%7CRaleway:700' rel='stylesheet' type='text/css'>
        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <link href="http://fonts.googleapis.com/css?family=Cardo:400,400italic" rel="stylesheet" type="text/css">
        <link href="css/font-cardo.css" rel="stylesheet" type="text/css">
     
        
    </head>

    <body style="background-color: #fff">
    <%String db_url = "jdbc:mysql://localhost:3306/wine-bank"+"?verifyServerCertificate=true"+"&useSSL=true";
      String user_db = "root";
      String pass_db = "admin";
      Connection connessione = null;
      Class.forName("com.mysql.jdbc.Driver");
      connessione = DriverManager.getConnection(db_url,user_db,pass_db);
      Object temp_user = session.getAttribute("ID");
      String user = temp_user.toString();
      Statement cmd = connessione.createStatement();
      String query = "select * from carrello where user = '"+user+"'";
      ResultSet res = cmd.executeQuery(query);
      double temp = 0;
      String price_temp = null;%>
    	
        
        <div class="loader">
    		<div class="spinner">
			  <div class="double-bounce1"></div>
			  <div class="double-bounce2"></div>
			</div>
    	</div>
				
		<div class="nav-container">
			<nav class="centered-logo top-bar">
				<div class="container">
				
					
					
					<div class="row">
						<div class="col-sm-12 text-center">
							<a href="index_logged.jsp">
							<img class="logo logo-dark" alt="Logo" src="img/logo_wine.png">
						</div>
					</div>
				
				
					<div class="row nav-menu">
					
						<div class="col-sm-12 columns text-center">
														<ul class="menu">
                                                            <a></a>
                                                            <li><a href="index_logged.jsp" target="_self"><img src="img/blank.png" alt=""/>  Home</a></li>
                                                            <li><a href="chi_siamo_logged.jsp" target="_self"><img src="img/blank.png" alt=""/>  Chi Siamo</a></li>
                                                            <li><a href="marche_logged.jsp" target="_self"><img src="img/blank.png" alt=""/>  I nostri Marchi</a></li>
                                                            <li><a href="vini_logged.jsp" target="_self"><img src="img/blank.png" alt=""/>  Nostri Prodotti </a></li>
                                                            <li><a href="contatti_logged.jsp" target="_self"><img src="img/blank.png" alt=""/>  Contatti</a></li>
                                                            <li>
                                                            <a href="user_dashboard.jsp"> 
                                                            <img src="img/login.png" alt=""/>  <%if(session.getAttribute("ID")==null) {}%><%=session.getAttribute("ID") %>
                                                            </a>
                                                            </li>
                                                            <li><a href="carrello_logged.jsp" target="_self"><img src="img/cart.png" alt=""/>  Carrello</a></li>
							</ul>
		
						</div>
					</div>
					
					<div class="mobile-toggle">
						<i class="icon icon_menu"></i>
					</div>
					
				</div>
				<div class="bottom-border"></div>
			</nav>

		</div>
	
	

<section></section>
	
<div class="container">
	<table id="cart" class="table table-hover table-condensed" style="background: white;">
    				<thead>
						<tr>
							<th style="width:50%;" class="text-center">Prodotto</th>
							<th style="width:10%">Prezzo</th>
							<th style="width:8%">Quantità</th>
							<th style="width:22%" class="text-center">Subtotale</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
<% while(res.next()){ %>
					<tbody>
						<tr>
						<form method="post" action="opzioni_da_carrello">
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="<%=res.getString("img1")%>" class="product_img" style="float:right; border-radius:10px";/></div>
									<div class="col-sm-10">
										<br>
										<div class="product_name"><%= res.getString("nome_vino") %><input name="nome_vino" type="hidden" value="<%= res.getString("nome_vino") %>"/></div>
									</div>
								</div>
							</td>
							<td data-th="Price">€&emsp;<%=res.getDouble("prezzo")%></td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="<%=res.getInt("pezzi")%>" name="pieces">
							</td>
							
					<div style="display: none;"><%=temp = res.getDouble("prezzo")*res.getInt("pezzi")%>
					  <%=price_temp = String.format("%.2f", temp)%></div>
					  
							<td data-th="Subtotal" class="text-center">€&emsp;<%out.println(price_temp);%></td>
							<td class="actions" data-th="">
							
					<%
                    if(null!=request.getAttribute("errorMessage"))
                    {
                    	Object err = request.getAttribute("errorMessage");
                    	String error_msg = err.toString();
                    out.println("<html><body onload=\"alert('"+error_msg+"')\"></body></html>");
                    }
                    %>
							<br></br>
								<input class="btn" type="submit" value="Update" name="update_button"></input>	
								<br></br>
								<input class="btn" type="submit" value="Delete" name="delete_button"></input>
								<br></br>							
							</td>
							</form>
						</tr>
					</tbody>
<% }%>					
					<tfoot>
						<br></br>
						<tr>
							<td><input class="btn" type="submit" value="Back" onclick="window.location='store_logged.jsp';"/><i class="fa fa-angle-left"></i></td>
							<td colspan="2" class="hidden-xs"></td>
						 
					<%String query1 = "select Sum(prezzo*pezzi) as Result from carrello where user = '"+user+"'";
					  ResultSet res1 = cmd.executeQuery(query1);%>	
					  <% while(res1.next()){ %>
					  <form method="post" action="checkout_data">
					  <div style="display: none;"><%=temp = res1.getDouble("Result")%>
					  <%=price_temp = String.format("%.2f", temp)%></div>
							<td class="hidden-xs text-center"><strong>Total € <%out.println(price_temp);%></strong></td>
							<td><input class="btn" type="submit" value="Checkout"><i class="fa fa-angle-right"></i></input></td>
												<%
                    if(null!=request.getAttribute("errMessage"))
                    {
                    out.println("<html><body onload=\"alert('Carrello vuoto')\"></body></html>");
                    }
                    %>
						</tr></form>
						<% }%>
						
					</tfoot>
				</table>
</div>


</section>


			
<section style="background-color: #fff"></section>
<div class="footer-container">		
<footer class="short bg-secondary-1">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center">
							<ul class="social-icons">
							<h1 class="text-white">Seguici su i social Network </h1>	 
                                                                                           <li>
                                <a href="https://twitter.com/login?lang=it">
								<i class="icon social_twitter"></i>
								</a>
								</li>
								
								<li>
								<a href="https://www.facebook.com/">
								<i class="icon social_facebook"></i>
								</a>
								</li>
								
                                <li>
                                <a href="https://www.instagram.com/?hl=it">
                                <i class=" icon social_instagram"></i>
                                </a>
                                </li>
							</ul>
							<br>
							<br>
							<br>
							<font color="a87f97">© Copright 2018 e-Wine.&nbsp;
							
							
							
						</div>
						
						
					</div>
				</div>
			</footer>
		</div>
				
		
		<script src="js/jquery.min.js"></script>
        <script src="js/jquery.plugin.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.flexslider-min.js"></script>
        <script src="js/smooth-scroll.min.js"></script>
        <script src="js/skrollr.min.js"></script>
        <script src="js/spectragram.min.js"></script>
        <script src="js/scrollReveal.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/twitterFetcher_v10_min.js"></script>
        <script src="js/lightbox.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
				