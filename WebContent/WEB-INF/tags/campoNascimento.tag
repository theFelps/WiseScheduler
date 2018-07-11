<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "nascimento" required = "false"  %>
<fmt:parseDate value="${nascimento}" var="parseDate" pattern = "yyyy-MM-dd"/>
<fmt:formatDate pattern="dd/MM/yyyy" value="${parseDate}" var = "dataFormatada"/>

<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.nascimento.$invalid && !${classe}Form.nascimento.$pristine }">
<div class = "input-group">
<span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-tree-deciduous"></i></span>	
<input class="data form-control" type="text" ng-model="nascimento" name="nascimento" ng-init = "nascimento = '${dataFormatada}'"
	placeholder="Nascimento" ng-required="false">
	</div>
	
</div>