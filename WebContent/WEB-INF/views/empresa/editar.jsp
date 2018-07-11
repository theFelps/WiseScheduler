<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/jquery-1.2.6.pack.js"></script>
<script src="resources/js/jquery.maskedinput-1.1.4.pack.js"></script>
<script src="resources/js/number/number15.js"></script>
<script src="resources/js/mask/cnpj.js"></script>
<script src="resources/js/angular.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Editar empresa - ${empresa.id}</title>
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
	<h3>Editar empresa - ${empresa.id}</h3>
	<form action="alteraEmpresa" method="post">
		<input type = "hidden" name = "id" value = "${empresa.id}"/>
         <campo:formularioEmpresa 
         telefone="${empresa.telefone}" 
         buttonValue="Alterar" 
         nome="${empresa.nome}" 
         classe="empresa" 
         cnpj="${empresa.cnpj}" 
         endereco="${empresa.endereco}"
         ie="${empresa.ie}"
         im="${empresa.im}"
         email="${empresa.email}"
         >
         </campo:formularioEmpresa>

		
	</form>
	</div>
	</div>
	</div>
</body>
</html>