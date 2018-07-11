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
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' href='resources/css/form.css'>
<title>WS - Gerenciamento de empresas</title>
</head>
<body ng-app = "">
<div class = "container">
<div class = "row">
<div class = "col-md-12">
	<div ng-include="'resources/template/header.jsp'"></div>
</div>
<script>	
	$(document).ready( function () {
    $('#table_lista_empresas').DataTable({
    	"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
    	}
    });
} );
	</script>
</div>
<div class = "row" >
<div class = "col-md-2">
<div ng-include="'resources/template/menu.jsp'"></div>
</div>


<div class = "col-md-10">
    <h3>Empresas</h3>
	<c:if test = "${not empty empresas }">
	<a href= "novaEmpresa" class = "btn btn-primary">Cadastrar nova empresa</a> 
	</c:if>
	
	<br/> <br/>
	<c:if test = "${empty empresas}">
		Nenhuma empresa foi cadastrada até o momento. <a href = "novaEmpresa" class = "btn btn-success btn-sm" role = "button">Cadastrar empresa</a>
	</c:if>
   <message:messageLog/>
   
	<c:if test = "${not empty empresas }">
	<input type="text" class="input-search form-control" alt="lista-empresas" placeholder="Buscar nesta lista" />
	<table id="table_lista_empresas"class  = "lista-empresas table">
	<thead>
	<tr class = "active">
		
		<th>Cod.</th>
		<th>Nome</th>
		<th>Telefone</th>
		<th>Endereco</th>
		<th>E-mail</th>
		<th></th>
		<th></th>

	</tr>
			</thead>
		<c:forEach items = "${empresas}" var="empresa">
		<tbody>
		<tr>
			
			<td>${empresa.id}</td>
			<td>${empresa.nome}</td>
			<td>${empresa.telefone}</td>
			<td>${empresa.endereco}</td>
			<td>${empresa.email}</td>
			<td><a href = "mostraEmpresa?id=${empresa.id}" class = "btn btn-info btn-sm">Editar</a></td>
			<td><a href = "removeEmpresa?id=${empresa.id}" class = "btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover a empresa ${empresa.nome}?');" >Remover</a></td>
			
		</tr>
		</tbody>
	</c:forEach>
	</table>
	</c:if>
	</div>
	</div>
	</div>
	
</body>
</html>