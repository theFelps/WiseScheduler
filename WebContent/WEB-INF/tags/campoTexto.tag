<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="classe" required="true"%>
<%@ attribute name="id" required="true"%>
<%@ attribute name="required" required="true"%>
<%@ attribute name="value" required="true"%>
<%@ attribute name="icon" required="true"%>
<%@ attribute name="minLength" required="true"%>
<%@ attribute name="maxLength" required="true"%>
<%@ attribute name="anotherclass" required="true"%>
<%@ attribute name="placeholder" required="true"%>
<%@ attribute name="type" required="true"%>
  
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.${id}.$invalid && !${classe}Form.${id}.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "${icon}"></i></span>	
	 <input ng-model="${id}" class="form-control ${anotherclass}" id="${id}" type="${type}" name="${id}" placeholder="${placeholder}" ng-required="${required}"
		ng-minlength="${minLength}" ng-maxlength="${maxLength}" ng-init="${id}='${value}'" />
      
		</div>
		<p ng-show="${classe}Form.${id}.$error.minlength" class="help-block">${id}
			muito curto</p>
		<p ng-show="${classe}Form.${id}.$error.maxlength" class="help-block">${id}
			muito longo</p>
</div>

