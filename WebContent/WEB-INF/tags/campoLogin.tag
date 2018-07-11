<%@ attribute name="classe" required="true"%>
<%@ attribute name="login" required="false"%>

	
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.login.$invalid && !${classe}Form.login.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-tag"></i></span>	
	 <input ng-model="login" class="form-control" id="login" type="text" name="login" placeholder="Login" ng-required="true"
		ng-minlength="3" ng-maxlength="10" ng-init="login='${login}'" />

		</div>
		<p ng-show="${classe}Form.login.$error.minlength" class="help-block">Precisa ter no mínimo 3 chars.</p>
		<p ng-show="${classe}Form.login.$error.maxlength" class="help-block">Precisa ter no máximo 10 chars.</p>
</div>



