<!DOCTYPE HTML>
<html>
<head>
        <link rel="shortcut icon" type="image/png" href="img/index.png"/>
        <title>eWine - enoteca online</title>
        <link href="css/reg-form.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/theme-1.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
		<main>
			<div class="main">
				<div class="main-section">
				<div class="registration-section">
					<p class="form-title">
                   
						<a href="index_logged.jsp"><img src="img/logo_wine-iloveimg-resized.png"></p></a>
					<div class="register-form">

					<div class="registration-form">
					<form method="post" action="checkout">
						<input type="text" placeholder="@email" name="email"/>
                        <input type="text" placeholder="Indirizzo" name="indirizzo"/>
                        <input type="text" placeholder="Recapito" name="recapito"/>           
                        <input type="text" placeholder="Carta di credito" name="credit"/>
                        <img src="img/credit_cards.png">
                        <br></br>
						<input type="submit" value="CHECKOUT" class="btn btn-success btn-sm"/>
					</form>
					</div>
					<div class="clear"></div>
					<div style="margin: auto">
					<%
                    if(null!=request.getAttribute("errMessage"))
                    {
                    out.println("<html><body onload=\"alert('Compila correttamente ogni campo')\"></body></html>");
                    }
                    %></div>
			</div>

		<main>
</body>
