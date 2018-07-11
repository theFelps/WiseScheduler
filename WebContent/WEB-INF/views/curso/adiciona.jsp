<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/form.css'>
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/placeholderCheck.js"></script>
<script src="resources/js/jquery.maskedinput-1.1.4.pack.js"></script>
<script src="resources/js/number/number3.js"></script>
<script src="resources/js/mask/cpf.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/angular.min.js"></script>






<title>Novo curso</title>
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
	<h3>Adiciona curso</h3>
	<form action="adicionaCurso" method="post" name = "cursoForm">
	  <campo:formularioCurso classe="curso"
	     buttonValue="Cadastrar"
	  />
        
	</form>
	</div>
	</div>
	</div>
</body>
</html>