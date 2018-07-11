<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="data"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/mask/hora.js"></script>
<script src="resources/js/angular.min.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Editar Turma - ${turma.id}</title>
</head>
<body ng-app="">
	<div class="container">


		<div class="row">
			<div class="col-md-12">
				<div ng-include="'resources/template/header.jsp'"></div>
			</div>
		</div>


		<div class="col-md-2">

			<div ng-include="'resources/template/menu.jsp'"></div>

		</div>


		<div class="col-md-10">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">Alunos</a></li>
					<li><a href="#tabs-2">Agendamentos</a></li>
					<li><a href="#tabs-3">Geral</a></li>
				</ul>
				
				
				<div id="tabs-1">
					<h3>Alunos Matriculados</h3>
					<a href="adicionaEmTurma?id=${turma.id}"
						class="btn btn-info btn-sm">Adicionar Aluno</a>
					<div class="bg-success">${sucesso}</div>
					<c:if test="${not empty matriculas}">
						<table class="table">
							<tr class="active">
								<th>Cod.</th>
								<th>Aluno</th>
								<th>Patrocinador</th>
								<th>Valor</th>
								<th>Pago?</th>

								<th colspan="2" id="config">Configuração</th>
							</tr>
							<c:forEach items="${matriculas}" var="matricula">
								<tr class="">
									<td>${matricula.id}</td>
									<td>${matricula.aluno.nome}</td>
									<td>${matricula.empresa.nome}</td>
									<td><fmt:setLocale value="pt-br" /> <fmt:formatNumber
											value="${matricula.valor}" type="currency" /></td>

									<td><c:if test="${matricula.pago == true}">


											<a href="alteraPagoNAO/${turma.id}/${matricula.id}">
											<button type="button" class="btn btn-success btn-xs">Sim</button>
											</a>

										</c:if> <c:if test="${matricula.pago == false }">


											<a href="alteraPagoSIM/${turma.id}/${matricula.id}">
											<button type="button" class="btn btn-danger btn-xs">Não</button>
												</a>

										</c:if></td>

									<td><a
										href="removeMatriculaTurma/${turma.id}/${matricula.id}">Remover</a>
									</td>
								</tr>

							</c:forEach>
						</table>
					</c:if>
				</div>

				<div id = "tabs-2">
				<div class = "row">
				 <h3>Agendamento de salas da turma ${turma.id}</h3>
				<a href = "novoAgendamento?id=${turma.id}" class = "btn btn-info btn-sm">Novo horário de turma</a>
				</div>
				<div class = "row">
				<c:if test="${not empty agendamentos}">
				<table class = "table">
				<tr class = "active">
					<th>Hora Inicio</th>
					<th>Hora Fim</th>
					<th>Data Inicio</th>
					<th>Data Fim</th>
					<th>Sala</th>
					<th>Configuração</th>
				</tr>
		<c:forEach items="${agendamentos}" var="agendamento">
				<tr class = "">	      
				     <td><fmt:formatDate value ="${agendamento.horaInicio}" pattern="kk:mm"/></td>
				     <td><fmt:formatDate value ="${agendamento.horaFim}" pattern="kk:mm"/></td>		     
				     <td><fmt:formatDate value ="${agendamento.dataInicio}" pattern = "dd/MM/yyyy" /></td>		 
				     <td><fmt:formatDate value ="${agendamento.dataFim}" pattern = "dd/MM/yyyy" /></td>
				     <td>${agendamento.sala.nome_sala}</td>
				     <td>
					     <a class = "btn btn-danger btn-sm" role="button" href="removeAgendamento/${agendamento.turma.id}/${agendamento.id}">Remover</a>
					 </td>
				</tr>
		</c:forEach>
				     
				</table>
				</c:if>
				<c:if test="${empty agendamentos}">
					Turma não agendada
				</c:if>
				</div>
				</div>
				<div id="tabs-3">
					<h3>Editar turma - ${turma.id}</h3>


					<form action="alteraTurma" method="post">
						<input type="hidden" name="id" value="${turma.id}" />

						<label for="observacao">Observação: </label>
						<input type = text class="form-control" rows="3" id="observacao" name="observacao" value = "${turma.observacao}"/> 

						<br>
						<p>Curso atual: ${turma.curso.nome}</p>
						<select name="cursoId">
							<option value="${turma.curso.id}">${turma.curso.nome}</option>
							<c:forEach items="${todosCursos}" var="curso">
								<option value="${curso.id}">${curso.id}-${curso.nome}</option>
							</c:forEach>
						</select>

						<p>Instrutor atual: ${turma.instrutor.nome}</p>
						<select name="instrutorId">
							<option value="${turma.instrutor.id}">${turma.instrutor.nome}
							</option>
							<c:forEach items="${todosInstrutores}" var="instrutor">
								<option value="${instrutor.id}">${instrutor.id}-
									${instrutor.nome}</option>
							</c:forEach>
						</select>


						<button>Salvar</button>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>