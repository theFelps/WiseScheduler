
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class = "panel panel-default"  >
	<div class="panel-heading" >
	<h4>Gerenciamento</h4>
	</div>


	<div class="panel-body">
		<div class = "list-group">
	  		<a type="button" class="list-group-item" href="listaCalendario"><span class="glyphicon glyphicon-calendar"></span> Calendário</a>
  	  		<a type="button" class="list-group-item" href="listaTurma"><span class="glyphicon glyphicon-education"></span> Turmas</a>
 	  		<a type="button" class="list-group-item" href="listaSala"><span class="glyphicon glyphicon-home"></span> Salas</a>
  	  		<a type="button" class="list-group-item" href="listaAluno"><span class="glyphicon glyphicon-user"></span> Alunos</a>
  	  		<a type="button" class="list-group-item" href="listaInteressado"><span class="glyphicon glyphicon-user"></span> Interessados</a>
  	  		<a type="button" class="list-group-item" href="listaCurso"><span class="glyphicon glyphicon-book"></span> Cursos</a>
  	  		<a type="button" class="list-group-item" href="listaInstrutor"><span class="glyphicon glyphicon-hand-right"></span> Instrutor</a>
  	  		<a type="button" class="list-group-item" href="listaEmpresa"><span class="glyphicon glyphicon-briefcase"></span> Empresa</a>
  	        <c:if test= "${usuarioLogado.tipoUsuario == 0}"> 
      			<a type="button" class="list-group-item" href="listaConfiguracoes"><span class="glyphicon glyphicon-wrench"></span> Config.</a>
      		</c:if>
    	</div>
	</div>
</div>
