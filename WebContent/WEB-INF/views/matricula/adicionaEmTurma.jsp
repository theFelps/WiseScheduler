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
<script type="text/javascript" src="resources/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="resources/js/input-search.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/placeholderCheck.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/angular.min.js"></script>
<script src="resources/js/jquery.maskMoney.min.js"></script>
<script src="resources/js/mask/reais.js"></script>
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
	<h3>Adicionar aluno na turma Cod.${turma.id} - Curso: ${turma.curso.nome }</h3>
		
		
		<form action="adicionaMatricula" method="post">
		<div class = "row">	
			<p>Aluno:</p>
			<a class="btn" id="buscar" onclick="mostraModal()"><i class = "glyphicon glyphicon-plus"></i></a>
			
		</div>
		<div class = "row">	
			<input type = "hidden" id = "alunoId" name = "alunoId"/> 
			<p class="alunoDados" style="display: none"><i class="glyphicon glyphicon-user"></i> <span id="alunoNome"></span></p>
			<p class="alunoDados" style="display: none"><i class="glyphicon glyphicon-phone"></i> <span id="alunoTelefone"></span></p>
		</div>
		
		<div class = "row">	
			<p>Empresa:</p>
			<a class="btn" id="buscar" onclick="mostraEmpresaModal()"><i class = "glyphicon glyphicon-plus"></i></a>
			
		</div>
		<div class = "row">	
			<input type = "hidden" id = "empresaId" name = "empresaId"/> 
			<p class="empresaDados" style="display: none"><i class="glyphicon glyphicon-briefcase"></i> <span id="empresaNome"></span></p>

		</div>
			<div class = "row">
     		<div class="input-group">
			<span class="input-group-addon">R$</span>
			<input class = "form-control" id = "valor" type="text" name="valor" value = "${turma.curso.valor}"/>	
			</div>
		
			</div>
			
			
			<div class = "checkbox">
  			<input type="checkbox" name="pago" value="1">Pago
			<input type= "hidden"  name="pago" value="0">
			</div>
			
			
			<input type = "hidden" name = "turmaId" value = "${turma.id}"/>
			<div class = "row">
			<button>Matricular aluno</button>
			</div>
	   </form>
	   </div>
	   
	   
	   
	   		<div class = "col-md-4">
			<div id = "myModal" style = "display: none">
			<div class = "row">	
			<div class = "col-md-2">
			<a class="btn" id="buscar" onclick="fechaModal()"><i class="glyphicon glyphicon-remove"></i></a>
			</div>
			
			<div class = "col-md-12">
			<div class = "input-group">
	
			</div>
			</div>
			</div>
			<c:if test = "${not empty todosAlunos}" > 
			<input type="text" class="input-search form-control" alt="lista-alunos" placeholder="Buscar nesta lista" />
			<table class =  "lista-alunos table table-striped" id = "searchTextResults">
			<thead>
					<tr >
					<th></th>
			     	<th>Cod</th>
     				<th>Nome</th>
     				<th>Telefone</th>
     				</tr>
     		</thead>
     		<tbody>
     		
     				<c:forEach items="${todosAlunos}" var="aluno">
     				  <tr>
     					<td><a onclick="retornar('${aluno.id}', '${aluno.nome}', '${aluno.telefone}')" > <i class="glyphicon glyphicon-user"> </i> </a> </td>
     					<td>${aluno.id}</td>
     					<td>${aluno.nome}</td>
     					<td>${aluno.telefone} }</td>
     					</tr>
     			
					</c:forEach>
		   
	
			</tbody>		
     		</table>
     		 </c:if>
     		 <c:if test = "${empty todosAlunos}" > 
		    	Nenhum aluno disponivel para esta turma
		    </c:if>		
     		</div>
     		</div>
     		
     	    <div class = "col-md-4">
			<div id = "empresaModal" style = "display: none">
			<a class="btn" id="buscar" onclick="fechaEmpresaModal()"><i class="glyphicon glyphicon-remove"></i></a>
			<input type="text" class="input-search form-control" alt="lista-empresas" placeholder="Buscar nesta lista" />
			<table class =  "lista-empresas table table-striped">
			<thead>
					<tr>
					<th></th>
			     	<th>Cod</th>
     				<th>Nome</th>
     				</tr>
     		</thead>
     		<tbody>
     				<c:forEach items="${todasEmpresas}" var="empresa">
     				<tr>
     					<td><a onclick="retornarEmpresa('${empresa.id}', '${empresa.nome}')" > <i class="glyphicon glyphicon-briefcase"> </i> </a> </td>
     					<td>${empresa.id}</td>
     					<td>${empresa.nome}</td>
     				</tr>
					</c:forEach>
			</tbody>		
     		</table>
     		</div>
     		</div>
     		
     		
     		
     		
	   
	   </div>
	   </div>
	   <script type = "text/javascript">
	   
	   function filtraAluno(nome){
		   $(".alunoDados").css("display", "block");
	   }
	   
	   	function mostraEmpresaModal(){
	   		fechaModal();
			document.getElementById("empresaModal").style.display="inline";
		}
	   	
		function fechaEmpresaModal(){
			document.getElementById("empresaModal").style.display="none";
		}
		
		function retornarEmpresa(a,b){
			$("#empresaNome").text(b);
			$("#empresaId").val(a);
		
			
			$(".empresaDados").css("display", "block");
			
			fechaEmpresaModal();
		}
		
	   	function mostraModal(){
	   		fechaEmpresaModal();
			document.getElementById("myModal").style.display="inline";
		}
		function fechaModal(){
			document.getElementById("myModal").style.display="none";
		}
		function retornar(a,b,c){
			$("#alunoNome").text(b);
			$("#alunoId").val(a);
			$("#alunoTelefone").text(c);
			
			$(".alunoDados").css("display", "block");
			
			fechaModal();
		}
		
		</script>
</body>
</html>