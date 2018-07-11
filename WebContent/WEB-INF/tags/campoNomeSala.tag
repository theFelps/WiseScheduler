<%@ attribute name="classe" required="true"%>
<%@ attribute name="nomeSala" required="false"%>

	
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.nome.$invalid && !${classe}Form.nomeSala.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-home"></i></span>	
	 <input ng-model="nome" class="form-control" id="nome" type="text" name="nome_sala" placeholder="Nome da sala" ng-required="true"
		ng-minlength="3" ng-maxlength="10" ng-init="nome='${nomeSala}'" />

		</div>
		<p ng-show="${classe}Form.nomeSala.$error.minlength" class="help-block">Nome da sala
			muito curto</p>
		<p ng-show="${classe}Form.nomeSala.$error.maxlength" class="help-block">Nome da sala
			muito longo</p>
</div>



