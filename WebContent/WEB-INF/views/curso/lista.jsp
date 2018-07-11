<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="message" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script type="text/javascript" src="resources/js/angular.min.js"></script>
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/input-search.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerenciamento de cursos</title>
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

<script>	
	$(document).ready( function () {
    $('#table_lista_cursos').DataTable({
    	"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
    	}
    });
} );
	</script>	
<div class = "col-md-10">
	<h3>Cursos</h3>
	<c:if test = "${not empty cursos }">
	<a href= "novoCurso" class = "btn btn-primary" >Cadastrar novo curso</a> 
	</c:if>
	
	<br/> <br/>
	
	<c:if test="${empty cursos}">
		Nenhum curso foi cadastrado até o momento. <a href= "novoCurso" class = "btn btn-success btn-sm" role = "button">Cadastrar curso</a> 
	</c:if>
	
   <message:messageLog/>
	
	<c:if test="${not empty cursos}">
	<table id = "table_lista_cursos" class = "lista-cursos table">
	<thead>
	<tr class = "active">
		<th>Nome</th>
		<th>Patrocinador</th>
		<th>Tipo</th>
		<th>Codigo</th>
		<th>Duração</th>
		<th>Valor</th>
		<th></th>
		<th></th>
		

	</tr>
	</thead>
	<tbody>
	<c:forEach items = "${cursos}" var="curso">
		<tr>
			<td>${curso.nome}</td>
			<td>${curso.patriocinador}</td>
			<td>${curso.tipo}</td>
			<td>${curso.codigo}</td>
			<td>${curso.duracao}</td>
			<td>
					<fmt:setLocale value="pt_BR"/>
					<fmt:formatNumber value="${curso.valor}" type="currency"/>
			</td>
			<td><a href = "mostraCurso?id=${curso.id}" class = "btn btn-info btn-sm">Editar</a></td>
			<td><a href = "removeCurso?id=${curso.id}" class = "btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover o curso ${curso.nome}?');" >Remover</a></td>
		</tr>
		
	</c:forEach>
	</tbody>
	</table>
	</c:if>
	</div>
	</div>
	</div>
</body>
</html>