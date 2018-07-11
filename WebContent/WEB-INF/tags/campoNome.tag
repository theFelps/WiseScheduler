<%@ attribute name="classe" required="true"%>
<%@ attribute name="nome" required="false"%>

	
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.nome.$invalid && !${classe}Form.nome.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-user"></i></span>	
	 <input ng-model="value" class="form-control" id="nome" type="text" name="nome" placeholder="Nome" ng-required="true"
		ng-minlength="3" ng-maxlength="50" ng-init="value='${nome}'" />

		</div>
		<p ng-show="${classe}Form.nome.$error.minlength" class="help-block">Nome
			muito curto</p>
		<p ng-show="${classe}Form.nome.$error.maxlength" class="help-block">Nome
			muito longo</p>
</div>



