<%@ attribute name="classe" required="true"%>
<%@ attribute name="tipo" required="false"%>

	
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.capacidade.$invalid && !${classe}Form.capacidade.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-resize-horizontal"></i></span>	
	 <input ng-model="tipo" class="number form-control" id="tipo" type="text" name="tipo" placeholder="tipo" ng-required="true"
		ng-minlength="1" ng-maxlength="1" ng-init="tipo='${tipo}'" />

		</div>
		<p ng-show="${classe}Form.capacidade.$error.minlength" class="help-block">capacidade
			muito curto</p>
		<p ng-show="${classe}Form.capacidade.$error.maxlength" class="help-block">capacidade
			muito longo</p>
</div>



