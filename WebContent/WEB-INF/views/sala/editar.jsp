<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Editar sala - ${sala.id}</title>
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
	<h3>Editar sala - ${sala.id}</h3>

	<form action="alteraSala" method="post" name = "salaForm">
	<input type = "hidden" name = "id" value = "${sala.id}"/>
	<campo:formularioSala classe="sala"
	nomeSala="${sala.nome_sala}"
	capacidade="${sala.capacidade}"
	cor= "${sala.cor}" 
	buttonValue="Editar"/>
	</form>
	   
	   
	   </div>
	   </div>
	   </div>
</body>
</html>