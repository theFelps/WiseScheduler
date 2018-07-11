<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "nome" required = "true"  %>
<%@ attribute name = "telefone" required = "true"  %>
<%@ attribute name = "endereco" required = "true"  %>
<%@ attribute name = "cnpj" required = "true"  %>
<%@ attribute name = "ie" required = "true"  %>
<%@ attribute name = "im" required = "true"  %>
<%@ attribute name = "email" required = "true"  %>
<%@ attribute name = "buttonValue" required = "true"  %>

<campo:campoTexto maxLength="30" minLength="3" type="text" icon="glyphicon glyphicon-briefcase" classe="${classe}" value="${nome}" required="true" id="nome" anotherclass="" placeholder="Nome da empresa"/>
<campo:campoTexto maxLength="12" minLength="8" type="text" icon="glyphicon glyphicon-phone" classe="${classe}" value="${telefone}" required="true" id="telefone" anotherclass="" placeholder="Telefone"/>
<campo:campoTexto maxLength="30" minLength="3" type="text" icon="glyphicon glyphicon-map-marker" classe="${classe}" value="${endereco}" required="false" id="endereco" anotherclass="" placeholder="Endereço"/>
<campo:campoCnpj type="text" icon="glyphicon glyphicon-credit-card" classe="${classe}" value="${cnpj}" required="true" id="cnpj"/>
<campo:campoTexto id="ie" maxLength="15" minLength="1" anotherclass="number15" classe="${classe}" required="true" type="text" icon="glyphicon glyphicon-globe" value="${ie}" placeholder="Inscrição Estadual"/>
<campo:campoTexto id="im" maxLength="15" minLength="1" anotherclass="number15" classe="${classe}" required="true" type="text" icon="glyphicon glyphicon-globe" value="${im}" placeholder="Inscrição Municipal"/>
<campo:campoEmail classe="${classe}" email="${email}" required="false"/>
<campo:button classe="${classe}" nameButton="${buttonValue}"/>


