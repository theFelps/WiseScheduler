<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ attribute name="classe" required="true"%>
<%@ attribute name="id" required="true"%>
<%@ attribute name="required" required="true"%>
<%@ attribute name="value" required="true"%>
<%@ attribute name="icon" required="true"%>
<%@ attribute name="type" required="true"%>
<c:set var="cnpj" value="${id}"/>
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.${id}.$invalid && !${classe}Form.${id}.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "${icon}"></i></span>	
	 <input ng-model="${id}" class="form-control" id="${id}" type="${type}" name="${id}" placeholder="${fn:toUpperCase(cnpj)}" ng-required="${required}"
	      ng-init="${id}='${value}'" />
		</div>
</div>
<script src="resources/js/mask/cnpj.js"></script>