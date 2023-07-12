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
					<form method="post" action="log_in">
                        <input type="text" placeholder="Username" name="nome"/>
                        <input type="password" placeholder="Password" name="pass"/>
                        <br></br>
						<input type="submit" value="Accedi" class="btn btn-success btn-sm" />
					</form>
					</div>
					<div class="clear"></div>
					<div style="margin: auto">
					<%
                    if(null!=request.getAttribute("errorMessage"))
                    {
                    out.println(request.getAttribute("errorMessage"));
                    }
                    %></div>
			</div>

		<main>
</body>
