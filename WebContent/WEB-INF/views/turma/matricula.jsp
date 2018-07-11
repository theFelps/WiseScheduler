<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="data" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/form.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/placeholderCheck.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/mask/hora.js"></script>
<script src="resources/js/angular.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Adicionar aluno - Turma${turma.id}</title>
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
	<h3>Adicionar aluno na turma Cod.${turma.id} - Curso: ${turma.curso.nome }</h3>

		<form action="alteraTurma" method="post">
			<input type = "hidden" name = "id" value = "${turma.id}"/>
			
			<fmt:formatDate pattern="dd/MM/yyyy" value="${turma.dataInicio}" var = "dataInicio"/>
			<label>Inicio: </label>
		    <data:campoData id="dataInicio" value="${dataInicio}"/>
			
			<fmt:formatDate pattern="dd/MM/yyyy" value="${turma.dataFim}" var = "dataFim"/>
			<label>Inicio: </label>
		    <data:campoData id="dataFim" value="${dataFim}"/>
		    
		    <fmt:formatDate pattern="HH:mm" value="${turma.horaInicio}" var = "horaInicio"/>
		    <label>Horario inicial</label>
		    <input type = "text" class = "hora form-control" name = "horaInicio" value = "${horaInicio }">
		    
		    <fmt:formatDate pattern="HH:mm" value="${turma.horaFim}" var = "horaFim"/>
		    <label>Horario final</label>
		    <input type = "text" class = "hora form-control" name = "horaFim" value = "${horaFim }">
	    
		    <label for = "observacao">Observacao: </label>
			<textarea class = "form-control" id = "observacao"  name = "observacao" >${turma.observacao}</textarea>
			
			<br>
			<p>Curso atual: ${turma.curso.nome} </p>
			<select name = "cursoId">
     				<option value="${turma.curso.id}">${turma.curso.nome}   </option>
     				<c:forEach items="${todosCursos}" var="curso">
           				<option value="${curso.id}" > ${curso.id} - ${curso.nome}  </option>
           			</c:forEach>
     		</select>
     		
     		<p>Instrutor atual: ${turma.instrutor.nome} </p>
     		<select name = "instrutorId">
     				<option value="${turma.instrutor.id}">${turma.instrutor.nome}   </option>
     				<c:forEach items="${todosInstrutores}" var="instrutor">
           				<option value="${instrutor.id}" > ${instrutor.id} - ${instrutor.nome}  </option>
           			</c:forEach>
     		</select>
     		
     		<p>Sala atual: ${turma.sala.nome_sala} </p>
     		<select name = "salaId">
     				<option value="${turma.sala.id}">${turma.sala.nome_sala}   </option>
     				<c:forEach items="${todasSalas}" var="sala">
           				<option value="${sala.id}" > ${sala.id} - ${sala.nome_sala}  </option>
           			</c:forEach>
     		</select>
			
			<br>
			<button>Editar turma</button>
			
			<h3>Alunos Matriculados</h3>
			
			<c:if test = "${not empty matriculas}" > 
				<table border="1">
					<tr>
						<th>Cod.</th>
						<th>Aluno</th>
						<th>Patrocinador</th>
						<th>Valor</th>
						<th>Pago?</th>
						
						<th colspan="2" id="config">Configuração</th>
					</tr>
					<c:forEach items="${matriculas}" var="matricula">
						<tr>
							<td>${matricula.id}</td>
							<td>${matricula.aluno.nome}</td>
							<td>${matricula.empresa.nome}</td>
							<td>${matricula.valor}</td>
							<td>${matricula.pago}</td>
			
							<td>
								<a class = "btn btn-danger btn-sm" role="button" href="removeMatriculaTurma/${turma.id}/${matricula.id}">Remover</a>
							</td>
						</tr>
		
					</c:forEach>
				</table>
			</c:if>
			
	   </form>
	   </div>
	   </div>
	   </div>
</body>
</html>