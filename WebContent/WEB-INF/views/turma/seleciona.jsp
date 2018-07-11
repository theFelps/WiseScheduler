<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
<link rel='stylesheet' href='resources/css/form.css'>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seleciona alunos - ${matricula.curso.nome}</title>
</head>
<body>

<div class = "row">
<div class = "col-md-12">
	<h1>Wise Scheduler</h1>
</div>
</div>
<div class = "row" >
<div class = "col-md-3">
	
<div class = "menu">
	<h2>Gerenciamento</h2>
	
	
	<ul>
	
	<li>
	<a href="listaTurma">Turmas</a> 
	</li>
	<li>
	<a href="listaSala">Salas</a> 
	</li>
	<li>
	<a href="listaAluno">Alunos</a> 
	</li>
	<li>
	<a href="listaCurso">Cursos</a> 
	</li>
	<li>
	<a href="listaInstrutor">Instrutor</a> 
	</li>
    <li>
	<a href="listaEmpresa">Empresa</a> 
	</li>
	

	</ul>
	</div>
</div>	
<div class = "col-md-8">


	<br/> <br/>
	<table border="1">
	<tr>
		<th>Nome</th>
		<th>Telefone</th>
		<th>Valor</th>
		<th>Matricula</th>
		<th colspan = "2" id = "config">Configuração</th>

	</tr>
	<c:forEach items = "${alunos}" var="aluno">
		<tr>
			<td>${aluno.nome}</td>
			<td>${aluno.telefone}</td>
			<td><input type = "text" name = "valor" placeholder="valor"></td>
			<td><button>Efetuar matricula</button></td>
		</tr>
		
	</c:forEach>
	</table>
	</div>
	</div>
</body>
</html>