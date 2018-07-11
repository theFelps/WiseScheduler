<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "login" required = "false"  %>
<%@ attribute name = "senha" required = "false"  %>
<%@ attribute name = "nome" required = "false"  %>
<%@ attribute name = "email" required = "false"  %>
<%@ attribute name = "nameButton" required = "false"  %>

<campo:campoLogin classe="${classe}" login="${login}" />
<campo:campoSenha classe="${classe}" senha="${senha}" />
<campo:campoNome classe="${classe}" nome="${nome}" />
<campo:campoEmail classe="${classe}" email="${email}" required="true"/>
<campo:button classe="${classe}" nameButton="${nameButton}" />