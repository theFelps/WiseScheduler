<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/jquery.maskMoney.min.js"></script>
<script src="resources/js/jquery.maskedinput-1.1.4.pack.js"></script>
<script src="resources/js/number/number3.js"></script>
<script src="resources/js/mask/reais.js"></script>
<script src="resources/js/angular.min.js"></script>




<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Editar curso - ${curso.id}</title>
</head>
<body ng-app = "">
<div class = "container">
<div class = "row">
<div class = "col-md-12">
	<div ng-include="'resources/template/header.jsp'"></div>
</div>
</div>
<div class = "row" >
<div class = "col-md-3">
<div ng-include="'resources/template/menu.jsp'"></div>
</div>	
<div class = "col-md-4">
	<h3>Editar curso - ${curso.id}</h3>
	<form action="alteraCurso">
			<input type = "hidden" name = "id" value = "${curso.id}"/>
    <campo:formularioCurso classe="curso"
    nome="${curso.nome}"
    codigo="${curso.codigo}"
    patrocinador="${curso.patriocinador}"
    requisito="${curso.requisito}"
    tipo="${curso.tipo}"
    valor="${curso.valor}" 
    duracao="${curso.duracao}" 
    buttonValue="Salvar"
    />
		

	</form>
	</div>
	</div>
	</div>
</body>
</html>