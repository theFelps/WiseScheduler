<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
	

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/form.css'>
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/placeholderCheck.js"></script>
<script src="resources/js/jquery-1.2.6.pack.js"></script>
<script src="resources/js/jquery.maskedinput-1.1.4.pack.js"></script>
<script src="resources/js/mask/cpf.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/angular.min.js"></script>

<meta charset="ISO-8859-1">
<title>Novo Instrutor</title>
</head>
<body ng-app = "">
<div class = "container">
<div class = "row">
<div class = "col-md-12">
	<div ng-include="'resources/template/header.jsp'"></div>
</div>
</div>
<div class = "row" >
<div class = "col-md-2">
<div ng-include="'resources/template/menu.jsp'"></div>

</div>

<div class = "col-md-4">
    <h3>Adicionar instrutor</h3>
	<form action="adicionaInstrutor" method="post" name = "instrutorForm">
	<campo:formularioInstrutor classe="instrutor"
	
	buttonValue="Cadastrar"/>
	</form>
	</div>
	</div>
	</div>
</body>
</html>