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
						<h2>Ordine completato!</h2>
						<br>
						<div>Premi il pulsante Ordine per visualizzarne lo stato.</div>
                        <br></br>
						<input type="submit" value="Ordine" class="btn btn-success btn-sm" onclick="location.href='index.jsp';" />
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
