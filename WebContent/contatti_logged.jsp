
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
		<section class="map">
				<div class="map-holder">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3025.5058998357626!2d14.76885816679181!3d40.684854566090515!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc23488bfb48d%3A0x278aaa67b2cdf452!2sLargo+Andrea+Sinno%2C+173%2C+84126+Salerno+SA!5e0!3m2!1sit!2sit!4v1517020866174" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe> width="800" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>
			</section>
			
			<section class="contact-center">
				<div class="container">
					<div class="row">
						
					<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
							<h1>Avete Domande? <br>Forse vuoi solo provare i nostri vini?<br></h1>
							<p class="lead">contatto: info@ewine.com
                                                            
                                                            <br>Recapito Telefonico
                                                            <br><img src="img/whatsapp.png"> +0813335566 <br>
		<br>e-Wine<br> Provenienza Salerno,&nbsp;Campania Prov (SA)</p>
						</div><div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
							<div class="form-wrapper clearfix">
								<form class="form-contact email-form">
									<div class="inputs-wrapper">
										<input class="form-name validate-required" type="text" placeholder="Inserisci Nome" name="name">
										<input class="form-email validate-required validate-email" type="text" name="email" placeholder="Inserisci Indirizzo Email">
										<textarea class="form-message validate-required" name="message" placeholder="Inserisci Messaggio"></textarea>
									</div>
									<input type="submit" class="send-form" value="Invia">
									<div class="form-success">
										<span class="text-white">Messaggio inviato - Grazie per la tua richiesta</span>
									</div>
									<div class="form-error">
										<span class="text-white">Si prega di compilare tutti i campi correttamente</span>
									</div>
								</form>
							</div>
						</div></div>
					
					
				</div>
			</section>
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
							<font color="a87f97">© Copright 2018 e-Wine.&nbsp;<font color="ffffff"></a></font></span>
							
							
							
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
				
				