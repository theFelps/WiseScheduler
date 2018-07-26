<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="data"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel='stylesheet' href='resources/css/bootstrap.min.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<link rel='stylesheet' href='resources/css/fullcalendar.css'>
<!-- <link rel='stylesheet' href='resources/css/fullcalendar.print.css'> -->

<script src='resources/js/fullcalendar/lib/jquery.min.js'></script>
<script src='resources/js/bootstrap.min.js'></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/jquery.maskedinput.js"></script>
<script src="resources/js/angular.min.js"></script>
<script src='resources/js/fullcalendar/lib/moment.min.js'></script>
<script src='resources/js/fullcalendar.min.js'></script>
<script src='resources/js/fullcalendar/lang-all.js'></script>
<script src="resources/js/jscolor.min.js"></script>


<script>

function getContrast50(hexcolor){
    return (parseInt(hexcolor, 16) > 0xffffff/2) ? 'black':'white';
}
</script>



<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			lang : 'pt-br',
			header : {
				left : 'prev,next today',
				center : 'title',
				right: ""
// 				right : 'month, '//agendaWeek,agendaDay'
			},
			defaultDate : new Date(),
			editable : false,
			eventLimit : false, // allow "more" link when too many events
				
			
			eventClick: function(event, jsEvent, view){
		         $('#modalTitle').html(event.title);
		         $('#modalBody').html(event.description);
		         $('#modalEventStartDate').html(event.start);
		         $('#eventUrl').attr('href',event.url);
		         $('#fullCalModal').modal();
		         
		         return false;
		     },

			
			events : [ 
			<c:forEach items="${agendamentos}" var="agendamento">
			

			  {
				
				title : "T${agendamento.turma.id} - ${agendamento.turma.curso.nome} ${agendamento.turma.curso.codigo} - ${agendamento.turma.instrutor.nome}",
				start : '${agendamento.dataInicio}T00:00:00',
				end :   '${agendamento.dataFim}T23:00:00',
				url : 'mostraTurma?id=${agendamento.turma.id}', 
				color: '#${agendamento.sala.cor}',
  			    weekends: false,
  			    allDAy: false,
				tip: 'T${agendamento.turma.id} - ${agendamento.turma.curso.nome} ${agendamento.turma.curso.codigo} - ${agendamento.turma.instrutor.nome}. Clique para mais detalhes.',
				description:
							"<p>Turma Nº: ${agendamento.turma.id}</p>"+
				            "<p>Curso: ${agendamento.turma.curso.patriocinador} ${agendamento.turma.curso.nome} ${agendamento.turma.curso.codigo}</p>"+
				            "<p>Data: <fmt:formatDate value ="${agendamento.dataInicio}" pattern = "dd/MM/yyyy"/> - <fmt:formatDate value ="${agendamento.dataFim}" pattern = "dd/MM/yyyy"/> </p>"+
				            "<p>Horário: das <fmt:formatDate value ="${agendamento.horaInicio}" pattern="kk:mm"/> às <fmt:formatDate value ="${agendamento.horaFim}" pattern="kk:mm"/></p>"+
				            "<p>Instrutor: ${agendamento.turma.instrutor.nome}</p>"+
				            "<p>Alunos: ${agendamento.turma.numeroDeAlunos}</p>"+
				            "<p>Sala: ${agendamento.sala.nome_sala}</p>"+
				            "<p>Observação: ${agendamento.turma.observacao}<p>",

				           
			}, </c:forEach> ]
		});

	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calendário</title>
</head>
<body ng-app="">


<!-- Modal do calendario Events -->
<div id="fullCalModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="false">&times;</span> <span class="sr-only">close</span></button>
                <h4 id="modalTitle" class="modal-title"></h4>
            </div>
            <div id="modalBody" class="modal-body" >

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm" data-dismiss="modal">OK</button>
                	<a id ="eventUrl" target="_blank" href="" class = "btn btn-info">Editar</a>
            </div>
        </div>
    </div>
</div> 
	<!-- Modal end -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div ng-include="'resources/template/header.jsp'"></div>
			</div>
		</div>
		<div class="row" >
			<div class="col-md-2" >

				<div ng-include="'resources/template/menu.jsp'" ></div>

			</div>
			
			<div class="col-md-8 styleSpan" >
			<h3>Calendário</h3>
				<div id='calendar'>

				</div>
			</div>
			<div class="col-md-2">
			<h4>Salas:</h4>
			
				<c:forEach items="${salas}" var="sala">
				<div class = "row">
					<div class="col-md-1">
					<button disabled class = 
					" glyphicon glyphicon-home jscolor{valueElement:null, value:'${sala.cor}'}"
					value = "glyphicon glyphicon-home">
					</button>	
					</div>	
					<div class="col-md-8">
					  <p>&nbsp ${sala.nome_sala}</p>
				    </div>
					 
					
					</div>				
				</c:forEach>
			</div>
		</div>
	</div>



</body>
</html>