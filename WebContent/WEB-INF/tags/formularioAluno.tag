<%@ taglib tagdir="/WEB-INF/tags" prefix="campo" %>
<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "nome" required = "false"  %>
<%@ attribute name = "nascimento" required = "false"  %>
<%@ attribute name = "telefone" required = "false"  %>
<%@ attribute name = "endereco" required = "false"  %>
<%@ attribute name = "documento" required = "false"  %>
<%@ attribute name = "email" required = "false"  %>
<%@ attribute name = "rg" required = "true"  %>
<%@ attribute name = "buttonValue" required = "false"  %>

<campo:campoNome classe="${classe}" nome="${nome}"/>
<campo:campoNascimento classe="${classe}" nascimento="${nascimento}"/>
<campo:campoTelefone classe="${classe}" telefone="${telefone}" required="false"/>
<campo:campoEndereco classe="${classe}" endereco="${endereco}" />
<campo:campoCpf classe="${classe}" documento="${documento}"/>
<campo:campoTexto id="rg" maxLength="" minLength="" anotherclass="rg" classe="${classe}" required="false" type="text" icon="glyphicon glyphicon-list-alt" value="${rg}" placeholder="rg" />
<campo:campoEmail classe="${classe}" email="${email}" required="false"/>
<input type = "hidden" value = "aluno" name = "tipo"/>
<campo:button classe="${classe}" nameButton="${buttonValue}"/>