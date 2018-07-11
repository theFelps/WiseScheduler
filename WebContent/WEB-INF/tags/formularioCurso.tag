<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "nome" required = "false"  %>
<%@ attribute name = "patrocinador" required = "false"  %>
<%@ attribute name = "tipo" required = "false"  %>
<%@ attribute name = "codigo" required = "false"  %>
<%@ attribute name = "requisito" required = "false"  %>
<%@ attribute name = "valor" required = "false"  %>
<%@ attribute name = "duracao" required = "false"  %>
<%@ attribute name = "buttonValue" required = "false"  %>


<campo:campoTexto maxLength="30" minLength="3" icon="glyphicon glyphicon-book" classe="${classe}" required="true" id="nome" type = "text" value="${nome}" anotherclass="" placeholder="Nome"/> 
<campo:campoTexto maxLength="30" minLength="3" icon="glyphicon glyphicon-briefcase" classe="${classe}" required="true" id="patriocinador" type = "text" value="${patrocinador}" anotherclass="" placeholder="Patrocinador"/>
<campo:campoTexto maxLength="1" minLength="1" type="text" icon="glyphicon glyphicon-glass" classe="${classe}" required="true" id="tipo" value="${tipo}" anotherclass="" placeholder="Tipo"/>
<campo:campoTexto maxLength="10" minLength="1" type="text" icon="glyphicon glyphicon-barcode" classe="${classe}" required="true" id="codigo" value="${codigo}" anotherclass="" placeholder="Codigo"/>
<campo:campoTexto maxLength="30" minLength="3" type="text" icon="glyphicon glyphicon-thumbs-up" classe="${classe}" required="false" id="requisito" value="${requisito}" anotherclass="" placeholder="Requisito"/>
<campo:campoValor type="text" icon="glyphicon glyphicon-usd" classe="${classe}" required="true" id="valor" value="${valor}" />
<campo:campoTexto maxLength="3" minLength="1" type="text" icon="glyphicon glyphicon-dashboard" classe="${classe}" value="${duracao}" required="true" id="duracao" anotherclass="number3" placeholder="Duração"/>
<campo:button classe="${classe}" nameButton="${buttonValue}"/>
