<%@ attribute name="classe" required="true"%>
<%@ attribute name="senha" required="false"%>

	
	
	<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.senha.$invalid && !${classe}Form.senha.$pristine}">
		<div class = "input-group">
	 <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-asterisk"></i></span>	
	 <input ng-model="senha" class="form-control" id="senha" type="password" name="senha" placeholder="Senha" ng-required="true"
		ng-minlength="3" ng-maxlength="10" ng-init="value='${senha}'" />

		</div>
		<p ng-show="${classe}Form.senha.$error.minlength" class="help-block">Senha
			muito curta.</p>
		<p ng-show="${classe}Form.nome.$error.maxlength" class="help-block">Senha
			muito longa.</p>
</div>



