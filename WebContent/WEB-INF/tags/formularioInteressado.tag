<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "nome" required = "false"  %>
<%@ attribute name = "telefone" required = "false"  %>
<%@ attribute name = "email" required = "false"  %>
<%@ attribute name = "buttonValue" required = "true"  %>
<%@ attribute name = "observacao" required = "true"  %>

<campo:campoNome classe="${classe}" nome="${nome}"/>
<campo:campoTelefone classe="${classe}" telefone="${telefone}" required="false" />
<campo:campoEmail classe="${classe}" email="${email}" required="false" />
<campo:campoTexto id="observacao" maxLength="200" minLength="0" anotherclass="" classe="${classe}" required="false" type="textarea" icon="" placeholder="Obervação do interessado" value="${observacao}"/>
<input type = "hidden" value = "interessado" name = "tipo"/>
<campo:campoButton classe="${classe}" nameButton="${buttonValue}"/>