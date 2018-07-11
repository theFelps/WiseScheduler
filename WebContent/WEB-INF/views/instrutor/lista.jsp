<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="message" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<script src="resources/js/angular.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="resources/js/input-search.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' href='resources/css/form.css'>
<title>Gerenciamento de instrutores</title>
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
<div class = "col-md-10">
   <h3>Instrutor</h3>
	<c:if test = "${not empty instrutores }">
	<a href= "novoInstrutor" class = "btn btn-primary">Cadastrar instrutor</a> 
	</c:if>
	
	
	
	<c:if test = "${empty instrutores}">
		Nenhum instrutor cadastrado até o momento. <a href = "novoInstrutor" class = "btn btn-success btn-sm" role = "button">Adicionar instrutor</a>
	</c:if>
	<br/> <br/>
  <message:messageLog/>

	<c:if test = "${not empty instrutores}">
	<input type="text" class="input-search form-control" alt="lista-instrutores" placeholder="Buscar nesta lista" />
	<table class = "lista-instrutores table">
	<tr class = "active">
		<th>Nome</th>
		<th>Nascimento</th>
		<th>Telefone</th>
		<th>Endereco</th>
		<th>Documento</th>
		<th>E-Mail</th>
		<th colspan = "2" id = "config">Configuração</th>
		

	</tr>
	<c:forEach items = "${instrutores}" var="instrutor">
		<tr>
			<td>${instrutor.nome}</td>
			<td>
				<fmt:formatDate pattern="dd/MM/yyyy" value="${instrutor.nascimento}"/>
			</td>
			<td>${instrutor.telefone}</td>
			<td>${instrutor.endereco}</td>
			<td>${instrutor.documento}</td>
			<td>${instrutor.email}</td>
			<td><a href = "mostraInstrutor?id=${instrutor.id}" class = "btn btn-info btn-sm">Editar</a></td>
			<td><a href = "removeInstrutor?id=${instrutor.id}" class = "btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover o instrutor ${instrutor.nome}?');" >Remover</a></td>
		</tr>
		
	</c:forEach>
	</table>
	</c:if>
	</div>
	</div>
	</div>
</body>
</html>