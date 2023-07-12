<%-- 
    Document   : vini.jsp
    Created on : 17-gen-2018, 18.33.45
    Author     : giova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
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
        <!--[if gte IE 9]>
        	<link rel="stylesheet" type="text/css" href="css/ie9.css" />
		<![endif]-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,400,300,600,700%7CRaleway:700' rel='stylesheet' type='text/css'>
        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <link href="http://fonts.googleapis.com/css?family=Cardo:400,400italic" rel="stylesheet" type="text/css">
        <link href="css/font-cardo.css" rel="stylesheet" type="text/css">
     
        
    </head>

    <body>
    	
        
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
		
		<div class="main-container">
		</section>
                    <section class="text-banner">
				<div class="container text-center">
					<div class="row">
						<div class="col-sm-12">
							
							<h1 class="center-block">I nostri Vini</h1>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10 col-sm-offset-1">
							<p class="lead">
								Nella sezione Store si possono visualizzare i vini offerti dalla nostra enoteca</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<a href="store_logged.jsp" class="btn btn-primary" target="default">Scopri di più</a>
							
						</div>
					</div>
				</div>
			</section>
		<section class="team-1">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<h1>Incontra la collezione dei nostri vini</h1>
							<p class="lead">
								

Il vino rosso esprime l’anima creativa della civiltà e della sapienza enologica dell’uomo. Le sue origini si perdono nella notte dei tempi, nell’antica Mesopotamia, e la sua storia è strettamente legata alla cultura dei Paesi a forte vocazione vinicola, come l’Italia e la Francia. Su E-Wine trovi una vasta selezione di vini rossi, da quelli importanti e corposi a quelli più leggeri e beverini. Vini prestigiosi come i grandi vini rossi campani, oppure i vini francesi prodotti in Borgogna o Bordeaux, fino a quelli meno noti ma capaci di sorprendere. Vini che esprimono le caratteristiche di un territorio, che sono portavoce di uno stile, di una tradizione e di una passione umana che va al di là del tempo.

							</p>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-2 col-sm-4">
							<div class="team-1-member">
								<img alt="Team Member" class="background-image" src="img/vino1.png">
								<h5>Chardonnay</h5>
								<span>Lorem ipsum</span><br>
								
							</div>
						</div><div class="col-md-2 col-sm-4">
							<div class="team-1-member">
								<img alt="Team Member" class="background-image" src="img/vino2.png">
								<h5>Merlot</h5>
								<span>Dolor Sit</span><br>
								
							</div>
						</div><div class="col-md-2 col-sm-4">
							<div class="team-1-member">
								<img alt="Team Member" class="background-image" src="img/vino3.png">
								<h5>Pinot Noir</h5>
								<span>Modi tempora </span><br>
								
							</div>
						</div><div class="col-md-2 col-sm-4">
							<div class="team-1-member">
								<img alt="Team Member" class="background-image" src="img/vino4.png">
								<h5>Chenin Blanc</h5>
								<span>Magnam aliquam</span><br>
								
							</div>
						</div><div class="col-md-2 col-sm-4">
							<div class="team-1-member">
								<img alt="Team Member" class="background-image" src="img/vino5.png">
								<h5> Nebbiolo</h5>
								<span>Ipsum quia</span><br>
								
							</div>
						</div><div class="col-md-2 col-sm-4">
							<div class="team-1-member">
								<img alt="Team Member" class="background-image" src="img/vino6.png">
								<h5>Cabernet Franc</h5>
								<span>Numquam eius</span><br>
								
							</div>
						</div>
						
						
						
						
						
						
						
						
						
						
					</div>
					
				</div>
			</section>
			
			<section class="duplicatable-content pure-text">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center">
							<h1>Quale ti si adatta?</h1>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-4">
							<h6>Vino </h6>
							<p>
								At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.
							</p>
						</div>
						
						<div class="col-sm-4">
							<h6>Dolorem ipsum quia dolor sit amet</h6>
							<p>
								At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.
							</p>
						</div>
						
						<div class="col-sm-4">
							<h6>Fugiat quo voluptas nulla pariatur</h6>
							<p>
								At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.
							</p>
						</div>
					</div>
				</div>
			
			
			
		</div>
		
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
				