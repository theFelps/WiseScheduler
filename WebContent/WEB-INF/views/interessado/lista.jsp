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
<title>WiseScheduler-Interessados</title>
</head>
<body ng-app = "">

<div class = "container">

<div class = "row">
<div class = "col-md-12">
	<div ng-include="'resources/template/header.jsp'"></div>
</div>
</div>
<div class = "row">
<div class = "col-md-2">
   <div ng-include="'resources/template/menu.jsp'"></div>
</div>	
<script>	
	$(document).ready( function () {
    $('#table_lista_interessados').DataTable({
    	"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
    	}
    });
} );
	</script>

<div class = "col-md-10">
<h3>Interessados</h3>
	
	<c:if test = "${not empty alunos }">
	<a href= "novoInteressado" class = "btn btn-primary">Cadastrar novo interessado</a> 
	</c:if>

	<br/> <br/>
	<c:if test = "${empty alunos}"> 
		Nenhum interessado foi cadastrado até o momento. <a href= "novoInteressado" class = "btn btn-success btn-sm" role = "button">Cadastrar interessado</a>  
	</c:if> 	
    <message:messageLog/>
	
	<c:if test = "${not empty alunos}"> 
	<table id="table_lista_interessados"class = "lista-alunos table" >
	<thead>
	<tr class = "active">
		<th>Cod.</th>
		<th>Nome</th>
		<th>Telefone</th>
		<th>E-Mail</th>
		<th></th>
		<th></th>
		<th></th>

	</tr>
	</thead>
	<tbody>
	<c:forEach items = "${alunos}" var="aluno">
		<tr>
			<td>${aluno.id}</td>
			<td>${aluno.nome}</td>
			<td>${aluno.telefone}</td>
			<td>${aluno.email}</td>
			<td><a href = "mostraInteressado?id=${aluno.id}" class = "btn btn-info btn-sm">Editar</a></td>
			<td><a href = "removeInteressado?id=${aluno.id}" class = "btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover o interessado ${aluno.nome}?');" >Remover</a></td>
			<td><a href = "mostraAluno?id=${aluno.id}" class = "btn btn-info btn-sm">Tornar aluno</a></td>
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