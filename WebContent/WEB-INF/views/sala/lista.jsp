<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="message" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<script src="resources/js/angular.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="resources/js/input-search.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' href='resources/css/form.css'>
<title>Gerenciamento de salas</title>
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
<div class = "col-md-5">
    <h3>Salas</h3>
	<c:if test = "${not empty salas }">
	<a href= "novaSala" class = "btn btn-primary">Cadastrar nova sala</a> 
	</c:if>
	
	<br/> <br/>
	
	<c:if test = "${empty salas}">
		Nenhuma sala cadastrada até o momento. <a href = "novaSala" class = "btn btn-success btn-sm" role = "button">Cadastrar sala</a>
	</c:if>
        <message:messageLog/>
	<c:if test = "${not empty salas}">
	<input type="text" class="input-search form-control" alt="lista-salas" placeholder="Buscar nesta lista" />
	<table class = "lista-salas table">
	<tr class = "active">
		<th>Nome</th>
		<th>Capacidade</th>
		<th>Cor</th>
		<th colspan = "2" id = "config">Configuração</th>
		

	</tr>
	<c:forEach items = "${salas}" var="sala">
		<tr>
			<td>${sala.nome_sala}</td>
			<td>${sala.capacidade}</td>
			<td><div class="text-center btn col-md-12"style="background:#${sala.cor}"> </div></td>
			<td><a href = "mostraSala?id=${sala.id}" class = "btn btn-info btn-sm">Editar</a></td>
			<td><a href = "removeSala?id=${sala.id}" class = "btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover a Sala ${sala.nome_sala}?');" >Remover</a></td>
		</tr>
		
	</c:forEach>
	</table>
	</c:if>
	</div>
	</div>
	</div>
</body>
</html>