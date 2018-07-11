<%@ attribute name="classe" required="true"%>
<%@ attribute name="codigo" required="false"%>

	
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.codigo.$invalid && !${classe}Form.codigo.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-user"></i></span>	
	 <input ng-model="codigo" class="form-control" id="codigo" type="text" name="codigo" placeholder="Codigo" ng-required="true"
		ng-minlength="2" ng-maxlength="10" ng-init="codigo='${codigo}'" />

		</div>
		<p ng-show="${classe}Form.nome.$error.minlength" class="help-block">Codigo
			muito curto</p>
		<p ng-show="${classe}Form.nome.$error.maxlength" class="help-block">Codigo
			muito longo</p>
</div>



