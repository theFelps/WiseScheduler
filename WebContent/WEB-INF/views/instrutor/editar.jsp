<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
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
<script src="resources/js/angular.min.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Editar instrutor - ${instrutor.id}</title>
</head>
<body ng-app = "">
<div class = "container">
	<div class="row">
		<div class="col-md-12">
			<div ng-include="'resources/template/header.jsp'"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<div ng-include="'resources/template/menu.jsp'"></div>
		</div>
	
		<div class="col-md-8">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">Editar instrutor</a></li>
					<li><a href="#tabs-2">Cursos do instrutor</a></li>
				</ul>
			<div id = "tabs-1">	
			<h3>Editar instrutor - ${instrutor.nome}</h3>
			<form action="alteraInstrutor" name = "instrutorForm">
			<input type = "hidden" name = "id" value = "${instrutor.id}"/>
				<campo:formularioInstrutor classe="instrutor"
				documento="${instrutor.documento}"
				email="${instrutor.email}"
				endereco="${instrutor.endereco}"
				nascimento="${instrutor.nascimento}"
				nome="${instrutor.nome}"
				telefone="${instrutor.telefone}"
				buttonValue="Editar"/>
			</form>
		
	       </div>
        <div id = "tabs-2">	
		<h3>Cursos do instrutor</h3>
		
		
		<c:if test = "${empty cursos}" > 
			Nenhum curso foi adicionado para ${instrutor.nome} ainda.
		</c:if>
		<div class = "bg-success">${sucesso}</div> 
		<c:if test = "${not empty cursos}" > 
			<table class = "table">
				<tr class = "active">
					<th>Id</th>
					<th>Nome</th>
					<th>Patriocinador</th>
					<th>Tipo</th>
					<th>Codigo</th>
					<th>Requisito</th>
					<th colspan="2" id="config">Configuração</th>
				</tr>
				<c:forEach items="${cursos}" var="curso">
					<tr>
						<td>${curso.id}</td>
						<td>${curso.nome}</td>
						<td>${curso.patriocinador}</td>
						<td>${curso.tipo}</td>
						<td>${curso.codigo}</td>
						<td>${curso.requisito}</td>
								
						<td>
							<a href="removeCursoInstrutor/${curso.id}/${instrutor.id}" class = "btn btn-danger btn-sm" role="button">Remover</a>
						</td>
					</tr>
	
				</c:forEach>
			</table>
		</c:if>
		<table class = "table">
			<tr>
				<td>
     				 <form  action="adicionaCursoInstrutor/${instrutor.id}" >
     				 	<select name = "cursoId">
     				 	<option>"Selecione um novo curso:"  </option>
     				 	<c:forEach items="${todoscursos}" var="curso">
           					<option value="${curso.id}" > ${curso.id} - ${curso.nome}  </option>
           				</c:forEach>
     				 	</select>
     				 	<button>Adicionar</button>
     				 </form>
     				 
     				 
     				 
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
     </div>
	</div>
	</div>
</body>
</html>