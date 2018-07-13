<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/form.css'>
<script src="resources/js/angular.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body ng-app = "">
  <div class = "container">
	<div class = "row">
	<div class = "col-md-4"></div>
	<div class = "col-md-3">
	
	<h1 class = "bg-primary">Wise Scheduler</h1>
	</div>
	</div>

	<div class = "row">
	
	<div class = "col-md-4">
	</div>
	
	<div class = "col-md-3">

	<h2>Login</h2>
		<form action="efetuaLogin" method="post">
				<label for = "login">Usuário</label>
				<input id = "username" type = "text" name = "login" placeholder="Usuário" class = "form-control">
				<label id = "senha" for = "senha">Senha</label>
		        <input type = "password" name = "senha" placeholder="Senha" class = "form-control">
				<button>Login</button>
		</form>
	</div>
	</div>
	</div>
		
	<script src="resources/js/jquery-1.11.3.min.js"></script>
	<script src="resources/js/placeholderCheck.js"></script>
</body>
</html>