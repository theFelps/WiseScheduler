<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
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
<script src="resources/js/mask/cpf.js"></script>
<script src="resources/js/mask/rg.js"></script>
<script src="resources/js/angular.min.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Editar aluno - ${aluno.id}</title>
</head>
<body ng-app="">


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


<div class = "col-md-7">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">Editar Aluno</a></li>
					<li><a href="#tabs-2">Gerenciar Matrículas</a></li>
				</ul>
    <div id = "tabs-1">
	<h3>Editar aluno - ${aluno.id}</h3>
	<form action="alteraAluno" name = "alunoForm">
			<input type = "hidden" name = "id" value = "${aluno.id}"/>
			<input type = "hidden" name = "dataDeCadastro" value = "<fmt:formatDate pattern="MM/dd/yyyy" value="${aluno.dataDeCadastro}"/>"/>
			<campo:formularioAluno classe = "aluno"
			 nome="${aluno.nome}"
			 documento="${aluno.documento}"
			 email="${aluno.email}"
			 endereco="${aluno.endereco}"
			 nascimento="${aluno.nascimento}"
			 telefone="${aluno.telefone}"
			 rg="${aluno.rg}"	 	
			 buttonValue="Editar"/>
	</form>
	</div>
    <div id = "tabs-2">
			<c:if test = "${empty matriculasDoAluno}" >
			<p>${aluno.nome} não foi matriculado em nenhuma turma ainda. </p>	
			</c:if>
			<div class = "bg-success">${sucesso}</div> 
			<c:if test = "${not empty matriculasDoAluno}" > 
			<h3>Matrículas do Aluno</h3>
				<table class = "table">
					<tr class = "active">
						<th>Nº Matricula</th>
						<th>Aluno</th>
						<th>Patrocinador</th>
						<th>Valor</th>
						<th>Pago?</th>
						
						<th colspan="2" id="config">Configuração</th>
					</tr>
					<c:forEach items="${matriculasDoAluno}" var="matricula">
						<tr>
							<td><a href="mostraTurma?id=${matricula.turma.id}">${matricula.id}</a> </td>
							<td>${matricula.aluno.nome}</td>
							<td>${matricula.empresa.nome}</td>
							<td>${matricula.valor}</td>
							<td>
							<c:if test="${matricula.pago == true}">


											<a href="alteraPagoNAO/${matricula.turma.id}/${matricula.id}"><i
												class="alert alert-success glyphicon glyphicon-ok"></i></a>

										</c:if> <c:if test="${matricula.pago == false }">


											<a href="alteraPagoSIM/${matricula.turma.id}/${matricula.id}"><i
												class="alert alert-danger glyphicon glyphicon-remove"></i></a>

										</c:if>
							</td>
							<td>
								<a class = "btn btn-danger" href="removeMatriculaAluno/${aluno.id}/${matricula.id}">Remover</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
</div>
</div>
</div>
	</div>
		</div>

</body>
</html>