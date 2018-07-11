<%@ attribute name="classe" required="true"%>
<%@ attribute name="email" required="false"%>
<%@ attribute name = "required" required = "true"  %>

<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.email.$invalid && !${classe}Form.email.$pristine }">
	<div class = "input-group">
    <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-envelope"> </i></span>	
	<input type="email" name="email"
		class="form-control" ng-model="email"
		ng-init="email='${email}'" placeholder="seuemail@email.com" ng-required = "${required}"/>

   </div>
	<p ng-show="${classe}Form.email.$invalid && !${classe}Form.email.$pristine" 
	   class="help-block">Email inválido!</p>
</div>