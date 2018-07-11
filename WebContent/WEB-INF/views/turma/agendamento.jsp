<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="data" %>


<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/form.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<script src='resources/js/fullcalendar/lib/jquery.min.js'></script>
<script src='resources/js/bootstrap.min.js'></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/mask/data.js"></script>
<script src="resources/js/mask/hora.js"></script>
<script src="resources/js/angular.min.js"></script>

<%-- <c:if test="${erroCampoVazio}"> --%>
<!-- 		<script> -->
<!--  			alert("Um ou mais campos obrigatórios estão vazios.");         -->
<!-- 		</script> -->
<%-- </c:if> --%>


<c:if test = "${not empty agendamentoConflitante}">
<script >  
   $(window).load(function(){
        $('#agendamentoModal').modal('show');
    });
   
</script>
</c:if>


<meta charset="ISO-8859-1">
<title>Nova Turma</title>
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
	
		<c:forEach items="${messages}" var="message">
			<li class = "alert alert-danger"><c:out value="${message}"></c:out></li>
		</c:forEach>
	
<h3>Agendar turma: ${turma.id}</h3>
	<form action="adicionaAgendamento" method="post" >
			<label for="dataInicio">Data de início: </label>
		    <data:campoData id="dataInicio"  />
			
		    <label>Data Fim: </label> 
		    <data:campoData id="dataFim"  />
		    
		    <label>Horário de início</label>
		    <input type = "text"  name = "horaInicio" id= "horaInicio" placeholder="Horario inicial" class = "hora form-control" required>
		    
		    <label>Horario de fim</label>
		    <input type = "text"  name = "horaFim" id= "horaFim" placeholder="Horario final" class = "hora form-control" required>
	
			<select name="salaId" id= "salaId" required>
					<option value="${agendamento.sala.id}">${agendamento.sala.nome_sala}
						</option>
							<c:forEach items="${todasSalas}" var="sala">
								<option value="${sala.id}">${sala.id}-
									${sala.nome_sala}</option>
							</c:forEach>
						</select> <br>
		    
	    	
	    	<input name = "turmaId" id = "turmaId" type= "hidden" value ="${turma.id}"/>				
			<button>Incluir novo agendamento</button>
			
			
			  <div id = "agendamentoModal" class="modal fade" tabindex="-1" role="dialog">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title">Encontramos um problema! :(</h4>
				      </div>
				      <div class="modal-body">
				      	 <div class="alert alert-danger">
						  <strong>Ops! </strong>A data e a sala escolhida já está em uso pelos seguintes agendamentos: 
						</div>
				      	 <table class = "table">
				      	 <tr>
				      	  <th>Turma ID: </th>
				      	  <th>Sala ID: </th>
				      	  <th>Data Inicial</th>
				      	  <th>Data Final</th>
				      	  <th>Hora Inicial</th>
				      	  <th>Hora Final</th>
				      	 </tr>
				      	 
				      	<c:forEach items="${agendamentoConflitante}" var="agendamentoConflitante">
						<tr>
						 <td>${agendamentoConflitante.turma.id}</td>
						 <td>${agendamentoConflitante.sala.id}</td>
						 <td><fmt:formatDate value ="${agendamentoConflitante.dataInicio}" pattern = "dd/MM/yyyy"/></td>
						 <td><fmt:formatDate value ="${agendamentoConflitante.dataFim}" pattern = "dd/MM/yyyy"/></td>
						 <td><fmt:formatDate value ="${agendamentoConflitante.horaInicio}" pattern="kk:mm"/></td>
						 <td><fmt:formatDate value ="${agendamentoConflitante.horaFim}" pattern="kk:mm"/></td>
						 
						</tr>
				      	</c:forEach>
				      	</table>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->

			
			
	</form>
	</div>
	</div>
	</div>

</body>
</html>