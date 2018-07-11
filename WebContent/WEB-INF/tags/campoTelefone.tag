<%@ attribute name="classe" required="true"%>
<%@ attribute name = "telefone" required = "false"  %>
<%@ attribute name = "required" required = "true"  %>



<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.telefone.$invalid && !${classe}Form.telefone.$pristine }">
	<div class = "input-group">
	<span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-phone-alt"></i></span>	
	<input class="form-control" type="tel" 
		id="telefone" type="text" name="telefone" placeholder="Telefone"
		ng-required="${required}" ng-model="telefone" ng-init="telefone='${telefone}'" />
	</div>

</div>