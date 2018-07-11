
<%@ attribute name="classe" required="true"%>
<%@ attribute name="value" required="false"%>
<%@ attribute name="id" required="true"%>

	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.${id}.$invalid && !${classe}Form.${id}.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-user"></i></span>	
	 <input ng-model="${id}" class="form-control" id="${id}" type="text" name="${id}" placeholder="patrocinador" ng-required="true"
		ng-minlength="3" ng-maxlength="30" ng-init="${id}='${value}'" />

		</div>
		<p ng-show="${classe}Form.${id}.$error.minlength" class="help-block">${id}
			muito curto</p>
		<p ng-show="${classe}Form.${id}.$error.maxlength" class="help-block">${id}
			muito longo</p>
</div>



