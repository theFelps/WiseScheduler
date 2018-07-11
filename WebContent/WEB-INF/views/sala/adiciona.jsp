<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/jquery-1.2.6.pack.js"></script>
<script src="resources/js/jquery.maskedinput-1.1.4.pack.js"></script>
<script src="resources/js/mask/number.js"></script>
<script src="resources/js/angular.min.js"></script>
<script src="resources/js/jscolor.min.js"></script>


<meta charset="ISO-8859-1">
<title>Nova sala</title>
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
     <h3>Adicionar Sala</h3>
	<form action="adicionaSala" method="post" name = "salaForm">
	<campo:formularioSala classe="sala"
	buttonValue="Cadastrar"/>
	</form>
	
	</div>
	</div>
	</div>
</body>
</html>