<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.css'>
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/placeholderCheck.js"></script>
<script src="resources/js/jquery-1.2.6.pack.js"></script>
<script src="resources/js/jquery.maskedinput-1.1.4.pack.js"></script>
<script src="resources/js/mask/cpf.js"></script>
<script src="resources/js/mask/rg.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/angular.min.js"></script>
<script src="resources/js/angular-messages.js"></script>




<meta charset="ISO-8859-1">
<title>Novo interessado</title>
</head>
<body ng-app ="">
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
	<h3>Adicionar interessado</h3>	
	<form name = "alunoForm" action="adicionaInteressado" method="post">
		<campo:formularioInteressado classe = "aluno"
			buttonValue="Cadastrar interessado"
			observacao=""
			email=""
				/>
	
	</form>
	</div>
	</div>
	</div>
</body>
</html>