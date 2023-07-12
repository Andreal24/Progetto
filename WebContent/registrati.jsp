
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
                   
						<a href="index.jsp"><img src="img/logo_wine-iloveimg-resized.png"></p></a>
					<div class="register-form">

					<div class="registration-form">
					<form method="post" action="reg_account">
						<input type="text" placeholder="Nome" name="nome"/>
                        <input type="text" placeholder="Cognome" name="cognome"/>
                        <input type="text" placeholder="Codice Fiscale" name="cf"/>           
                        <input type="text" placeholder="Username" name="user"/>
                        <input type="password" placeholder="Password" name="password"/>
                        <br></br>
						<input type="submit" value="Registrati" class="btn btn-success btn-sm" />
					</form>
					</div>
					<div class="clear"></div>
					<div style="margin: auto">
					<%
                    if(null!=request.getAttribute("Message"))
                    {
                    out.println(request.getAttribute("Message"));
                    }
                    %></div>
			</div>

		<main>
</body>
