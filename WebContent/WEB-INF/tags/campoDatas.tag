<%@ attribute name = "idInicio" required = "true"  %>
<%@ attribute name = "idFim" required = "true"  %>
<%@ attribute name = "dataInicio" required = "false"  %>
<%@ attribute name = "dataFim" required = "false"  %>


<input id= "${idInicio}" name = "${id}" value = "${dataInicio}" placeholder="${idInicio}" class = "data form-control" />
<input id= "${idFim}" name = "${idFim}" value = "${dataFim}" placeholder="${idFim}" class = "data form-control" />
<script>
$("#${idInicio}").datepicker({
	    dateFormat: 'dd/mm/yy',
	    dayNames: ['Domingo','Segunda','Ter�a','Quarta','Quinta','Sexta','S�bado'],
	    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
	    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b','Dom'],
	    monthNames: ['Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
	    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
	    nextText: 'Pr�ximo',
	    prevText: 'Anterior'
	});
</script>
<script>
$("#${idFim}").datepicker({
	    dateFormat: 'dd/mm/yy',
	    dayNames: ['Domingo','Segunda','Ter�a','Quarta','Quinta','Sexta','S�bado'],
	    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
	    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b','Dom'],
	    monthNames: ['Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
	    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
	    nextText: 'Pr�ximo',
	    prevText: 'Anterior'
	});
</script>