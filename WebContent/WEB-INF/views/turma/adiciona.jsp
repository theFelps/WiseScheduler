<%@ taglib tagdir="/WEB-INF/tags" prefix="mensagem" %>
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
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/placeholderCheck.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/angular.min.js"></script>
<script src="resources/js/jquery.maskMoney.min.js"></script>
<script src="resources/js/mask/reais.js"></script>
<script src="resources/js/input-search.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WiseScheduler - Adicionar aluno - Turma ${turma.id}</title>
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
	<h3>Nova Turma</h3>
		<mensagem:messageLog/>
		
		<form action="adicionaTurma" method="post">
		<div class = "row">	
			<p>Curso:</p>
			<a class="btn" id="buscar" onclick="mostraCursoModal()"><i class = "glyphicon glyphicon-plus"></i></a>
			
		</div>
		<div class = "row">	
			<input type = "hidden" id = "cursoId" name = "cursoId"/> 
			<input type = "hidden" id = "numeroDeAlunos" name = "numeroDeAlunos" value = "0"/>
			<p class="cursoDados" style="display: none"><i class="glyphicon glyphicon-book"></i> <span id="cursoNome"></span></p>
		</div>
		
		<div class = "row">	
			<p>Instrutor:</p>
			<a class="btn" id="buscar" onclick="mostraInstrutorModal()"><i class = "glyphicon glyphicon-plus"></i></a>
			
		</div>
		<div class = "row">	
			<input type = "hidden" id = "instrutorId" name = "instrutorId"/> 
			<p class="instrutorDados" style="display: none"><i class="glyphicon glyphicon-user"></i> <span id="instrutorNome"></span></p>

		</div>
	<div class = "row">
	<label for = "observacao">Observacao: </label>
	<input type = text class="form-control" id="observacao" name="observacao" placeholder="Descrição breve para a turma (não obrigatório)"/> 
	</div>	
    <br/>
    <div class = "row">
			<button class="btn btn-primary"><i class = "glyphicon glyphicon-floppy-disk"></i>Cadastrar turma</button>	
	</div>
	   </form>
	   </div>
	   
	   
	   
	   		<div class = "col-md-4">
			<div id = "cursoModal" style = "display: none">
			<div class = "row">	
			<div class = "col-md-2">
			<a class="btn" id="buscar" onclick="fechaCursoModal()"><i class="glyphicon glyphicon-remove"></i></a>
			</div>
			
			<div class = "col-md-12">
			<div class = "input-group">
			<c:if test = "${not empty cursosListar}" > 

      		</c:if>		
			</div>
			</div>
			</div>
			<c:if test = "${not empty cursosListar}" > 
			<input type="text" class="input-search form-control" alt="lista-cursos" placeholder="Buscar nesta lista" />
			<table class =  "lista-cursos table table-striped" id = "searchTextResults">
			<thead>
					<tr >
					<th></th>
			     	<th>Cod</th>
     				<th>Nome</th>
     				</tr>
     		</thead>
     		<tbody>
     		
     				<c:forEach items="${cursosListar}" var="curso">
     				  <tr>
     					<td><a onclick="retornarCurso('${curso.id}', '${curso.nome}' )" > <i class="glyphicon glyphicon-book"> </i> </a> </td>
     					<td>${curso.codigo}</td>
     					<td>${curso.nome}</td>
     
     				  </tr>
     			
					</c:forEach>
		   
		   
		   
		   
	
			</tbody>		
     		</table>
     		 </c:if>
     		 <c:if test = "${empty cursosListar}" > 
		    	Nenhum curso disponível
		    </c:if>		
     		</div>
     		</div>
     		
     	    <div class = "col-md-4">
			<div id = "instrutorModal" style = "display: none">
			<a class="btn" id="buscar" onclick="fechaInstrutorModal()"><i class="glyphicon glyphicon-remove"></i></a>
			<input type="text" class="input-search form-control" alt="lista-instrutores" placeholder="Buscar nesta lista" />
			<table class =  "table table-striped lista-instrutores">
			<thead>
					<tr>
					<th></th>
			     	<th>Cod</th>
     				<th>Nome</th>
     				</tr>
     		</thead>
     		<tbody>
     				<c:forEach items="${instrutoresListar}" var="instrutor">
     				<tr>
     					<td><a onclick="retornarInstrutor('${instrutor.id}', '${instrutor.nome}')" > <i class="glyphicon glyphicon-user"> </i> </a> </td>
     					<td>${instrutor.id}</td>
     					<td>${instrutor.nome}</td>
     				</tr>
					</c:forEach>
			</tbody>		
     		</table>
     		</div>
     		</div>
     		
     		
     		
     		
	   
	   </div>
	   </div>
	
			   <script type = "text/javascript">
	   
	   function filtraCurso(nome){
		   $(".cursoDados").css("display", "block");
	   }
	   
	   	function mostraCursoModal(){
	   		fechaInstrutorModal();
			document.getElementById("cursoModal").style.display="inline";
		}
	   	
		function fechaCursoModal(){
			document.getElementById("cursoModal").style.display="none";
		}
		
		function retornarCurso(a,b){
			$("#cursoNome").text(b);
			$("#cursoId").val(a);
		
			
			$(".cursoDados").css("display", "block");
			
			fechaCursoModal();
		}
		
	   	function mostraInstrutorModal(){
	   		fechaCursoModal();
			document.getElementById("instrutorModal").style.display="inline";
		}
		function fechaInstrutorModal(){
			document.getElementById("instrutorModal").style.display="none";
		}
		function retornarInstrutor(a,b,c){
			$("#instrutorNome").text(b);
			$("#instrutorId").val(a);
		
			
			$(".instrutorDados").css("display", "block");
			
			fechaInstrutorModal();
		}
		
		</script>

	
</body>
</html>