<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="data"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="message" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/mask/hora.js"></script>
<script src="resources/js/angular.min.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>

<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
<script>	
	$(document).ready( function () {
    $('#table_lista_registros').DataTable({
    	"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
    	}
    });
} );
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Configurações</title>
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
					<li><a href="#tabs-1">Usuários</a></li>
					<li><a href="#tabs-2">Relatórios</a></li>
					<li><a href="#tabs-3">Logs</a></li>
				</ul>
				
				<div id="tabs-1">
					<h3>Usuários cadastrados</h3>
					<a href="novoUsuario"
						class="btn btn-info btn-sm">Adicionar Usuário</a>
					<message:messageLog/>
					<c:if test="${not empty usuariosCadastrados}">
						<table class="table">
							<tr class="active">
								<th>Cod.</th>
								<th>Login</th>
								<th>Nome</th>
								<th>Email</th>
								<th>Admin?</th>

								<th colspan="2" id="config">Configuração</th>
							</tr>
							<c:forEach items="${usuariosCadastrados}" var="usuarioCadastrado">
								<tr class="">
									<td>${usuarioCadastrado.id}</td>
									<td>${usuarioCadastrado.login}</td>
									<td>${usuarioCadastrado.nome}</td>
									<td>${usuarioCadastrado.email}</td>
									
									<td><c:if test="${usuarioCadastrado.tipoUsuario == 0}">
											<a href="alteraTipoNaoAdmin/${usuarioCadastrado.id}"><i
												class="alert alert-success glyphicon glyphicon-ok"></i></a>

										</c:if> <c:if test="${usuarioCadastrado.tipoUsuario == 1}">


											<a href="alteraTipoAdmin/${usuarioCadastrado.id}"><i
												class="alert alert-danger glyphicon glyphicon-remove"></i></a>

										</c:if></td>

									<td><a href = "removeUsuario?id=${usuarioCadastrado.id}" class = "btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover o usuário ${usuarioCadastrado.nome}?');" >Remover</a></td>
								</tr>

							</c:forEach>
						</table>
					</c:if>
				</div>
				<div id = "tabs-2">
					<h3>Relatório</h3>
					
					
				</div>
				<div id = "tabs-3">
					<h3>Logs</h3>
					<form action="filtraLog" method="post" class="col-md-4" >
						<label for="dataInicio">Data de início: </label>
		   				<data:campoData id="dataInicio"   />
			
		    			<label>Data Fim: </label> 
		    			<data:campoData id="dataFim"   />
		    
		    			<label>Horário de início</label>
		    			<input type = "text"  name = "horaInicio" id= "horaInicio" placeholder="Horario inicial" class = "hora form-control" >
		    
		    			<label>Horario de fim</label>
		    			<input type = "text"  name = "horaFim" id= "horaFim" placeholder="Horario final" class = "hora form-control" >
		    			<div class = "row">
							<button class="btn btn-primary"><i class = "glyphicon glyphicon-filter"></i>Filtrar</button>	
						</div>
		    		</form>
						
							<table id="table_lista_registros"class = "lista-registros table table-hover .table-responsive" >
								<thead>
								<tr class = "active">
									<th>Log Id</th>
									<th>Data de alteração</th>
									<th>Nome do registro</th>
									<th>Id do registro</th>
									<th>Tipo do registro</th>
									<th>Tipo de ação</th>
									<th>Usuário</th>
									<th>Usuário ID</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${logs}" var="log">
									<tr>
										<td>${log.id}</td>
										<td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${log.dataDeAlteracao}"/></td>
										<td>${log.nomeDoRegistro}</td>
										<td>${log.idDoRegistro}</td>
										<td>${log.nomeTabela}</td>
										<td>${log.nomeDaAcao}</td>
										<td>${log.usuarioNome}</td>
										<td>${log.usuarioId}</td>
									</tr>
							
								</c:forEach>
								</tbody>
							</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>