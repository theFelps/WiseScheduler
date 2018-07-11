<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "nomeSala" required = "false"  %>
<%@ attribute name = "capacidade" required = "false"  %>
<%@ attribute name = "cor" required = "false"  %>
<%@ attribute name = "buttonValue" required = "false"  %>

<campo:campoNomeSala   classe="${classe}" nomeSala="${nomeSala}"/>
<campo:campoCapacidade classe="${classe}" capacidade="${capacidade}"/>
<campo:campoCor cor="${cor}"/>
<br/>
<campo:button classe="${classe}" nameButton="${buttonValue}"/>