<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

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
        <!--[if gte IE 9]>
        	<link rel="stylesheet" type="text/css" href="css/ie9.css" />
		<![endif]-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,400,300,600,700%7CRaleway:700' rel='stylesheet' type='text/css'>
        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <link href="http://fonts.googleapis.com/css?family=Cardo:400,400italic" rel="stylesheet" type="text/css">
        <link href="css/font-cardo.css" rel="stylesheet" type="text/css">
     
        
    </head>

    <body style="background-color: #6b0a1e">
    <%String db_url = "jdbc:mysql://localhost:3306/wine-bank"+"?verifyServerCertificate=true"+"&useSSL=true";
      String user_db = "root";
      String pass_db = "admin";
      Connection connessione = null;
      Class.forName("com.mysql.jdbc.Driver");
      connessione = DriverManager.getConnection(db_url,user_db,pass_db);
      String codice = request.getParameter("codice");
      Statement cmd = connessione.createStatement();
      String query = "select codice, nome_vino, categoria, prezzo, pezzi, annata, img1 from prodotto";
      ResultSet res = cmd.executeQuery(query);%>
    	
        
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
				    <div class="demo">
        <div class="container demobg">
            <div class="row text-center">
            </div>		
            <div class="row">
            
<% while(res.next()){ %>			

            
            
            
                <div class="col-md-4 col-sm-6">
                    <div class="pricingTable">
                        <h3 class="title"><%= res.getString("nome_vino") %></h3>
                        <span class="amount"><img src=<%= res.getString("img1") %> alt="e-Wine"></span>
                        <span class="subtitle"></span>
                        <form method="post" action="aggiunta_carrello">
                        <ul class="pricing-content">
                            <li><strong>Codice:</strong> <%= res.getString("codice") %><input name="codice_univoco" type="hidden" value="<%= res.getString("codice") %>"/></li>
                            <li><strong>Annata:</strong> <%= res.getString("annata") %></li>
                            <li><strong>Prezzo:</strong> &#8364 <%= res.getString("prezzo") %></li>
                            <li><strong>Categoria:</strong> <%= res.getString("categoria") %></li>
                            <li><strong>Bottiglie:</strong> <%= res.getString("pezzi") %><input name="n_pezzi" type="hidden" value="<%= res.getString("pezzi") %>"/></li>
                        </ul>
                                          
                        
					<%
                    if(null!=request.getAttribute("errorMessage"))
                    {
                    out.println("<html><body onload=\"alert('Prodotto non disponibile')\"></body></html>");
                    }
                    %>
                     
                        <Button type="submit" class="pricingTable-signup" style="margin:auto;">Aggiungi al carrello</Button>
                        </form>
                    </div>
                </div>
                
                <div>

                	
                			

<% }%>		
                
	            </div>
        </div>
    </div>	
    

			

		
		<div class="footer-container">
		
			<footer class="short bg-secondary-1">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center">
							<ul class="social-icons">
							<br></br>
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
							<font color="a87f97">© Copright 2018 e-Wine.&nbsp; <font color="ffffff"></font></span>
							
							
							
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