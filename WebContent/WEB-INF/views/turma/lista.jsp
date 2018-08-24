<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="message" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel='stylesheet' href='resources/css/form.css'>
<title>Gerenciamento de turmas</title>



</head>

<body ng-app="">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div ng-include="'resources/template/header.jsp'"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div ng-include="'resources/template/menu.jsp'"></div>
			</div>
			<script>
				$(document)
						.ready(
								function() {
									$('#table_lista_turmas')
											.DataTable(
													{
														"language" : {
															"url" : "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
														}
													});
								});
			</script>
			<script>
					
			</script>
			
			

			<div class="col-md-10">
			<h3>Turmas</h3>
				<c:if test="${not empty turmas }">
					<a href="novaTurma" class="btn btn-primary">Cadastrar nova
						turma</a>
				   </c:if>
				

				<c:if test="${ empty turmas}">
						Nenhuma turma cadastrada até o momento. 
				<a href="novaTurma"	class="btn btn-success btn-sm" role="button">Cadastrar turma</a>
				</c:if>
				<br/> <br/>
           		<message:messageLog/>

				<c:if test="${not empty turmas}">
					<table id="table_lista_turmas" class="lista-turmas table">
						<thead>
						<tr class="active">
							<th>Cod.</th>
							<th>Matriculados</th>
							<th>Curso</th>
							<th>Instrutor</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${turmas}" var="turma">
							<tr>
								<td>${turma.id}</td>
								<td>${turma.numeroDeAlunos}</td>
								<td>${turma.curso.nome}</td>
								<td>${turma.instrutor.nome}</td>
								<td><a href="mostraTurma?id=${turma.id}" class="btn btn-info btn-sm">Editar</a></td>
								<td><a href="pdf?id=${turma.id}" class="btn btn-info btn-sm" role="button" disabled>Relatório</a></td>
								<td><a href="removeTurma?id=${turma.id}" class="btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover a turma ${turma.id}?');" >Remover</a></td>
								<td><a href="mostraTurma?id=${turma.id}" class="btn btn-info btn-sm">Editar</a></td>
								
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