<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/mask/hora.js"></script>
<script src="resources/js/mask/cpf.js"></script>
<script src="resources/js/mask/rg.js"></script>
<script src="resources/js/angular.min.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Editar interessado - ${aluno.id}</title>
</head>
<body ng-app="">


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


<div class = "col-md-7">

    <div id = "tabs-1">
	<h3>Editar interessado - ${aluno.id}</h3>
	<form action="alteraInteressado" name = "alunoForm">
			<input type = "hidden" name = "id" value = "${aluno.id}"/>
			<campo:formularioInteressado classe = "aluno"
			 nome="${aluno.nome}"
			 email="${aluno.email}"
			 telefone="${aluno.telefone}"
			 observacao="${aluno.observacao}"
			 buttonValue="Editar interessado"/>	 
	</form>
	</div>
   

		
	</div>
		</div>
		</div>

</body>
</html>