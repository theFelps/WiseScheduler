<%@ attribute name="classe" required="true"%>
<%@ attribute name="capacidade" required="false"%>

	
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.capacidade.$invalid && !${classe}Form.capacidade.$pristine}">
		<div class = "input-group">
	 <span 
	 	class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-resize-horizontal"></i></span>	
	 <input ng-model="capacidade" class="number form-control" id="capacidade" type="text" name="capacidade" placeholder="Capacidade" ng-required="true"
		ng-minlength="1" ng-maxlength="3" ng-init="capacidade='${capacidade}'" />

		</div>
		<p ng-show="${classe}Form.capacidade.$error.minlength" class="help-block">capacidade
			muito curto</p>
		<p ng-show="${classe}Form.capacidade.$error.maxlength" class="help-block">capacidade
			muito longo</p>
</div>



