<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/placeholderCheck.js"></script>
<script src="resources/js/number/number15.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/angular.min.js"></script>
<script src="resources/js/angular-messages.js"></script>

<meta charset="ISO-8859-1">
<title>Nova empresa</title>
</head>
<body ng-app = "">
<div class = "container">
<div class = "row">
<div class = "col-md-12">
	<div ng-include="'resources/template/header.jsp'"></div>
</div>
</div>
<div class = "row">
<div class = "col-md-2">
<div ng-include="'resources/template/menu.jsp'"></div>
</div>	
<div class = "col-md-4">
<h3>Adicionar empresa</h3>
	<form action="adicionaEmpresa" method="post" name = "empresaForm">
	 
		<campo:formularioEmpresa 
		telefone="" 
		buttonValue="Cadastrar" 
		nome="" 
		classe="empresa" 
		cnpj="" 
		ie=""
		im=""
		email=""
		endereco=""/>	
	</form>
	</div>
	</div>
	</div>
</body>
</html>