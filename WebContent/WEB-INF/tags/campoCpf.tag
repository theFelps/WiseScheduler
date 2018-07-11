<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "documento" required = "false"  %>

<div class="form-group input-group"
	ng-class="{ 'has-error' : ${classe}Form.documento.$invalid && !${classe}Form.documento.$pristine }">
    <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-list-alt"> </i> </span>	
	<input class="form-control" id="cpf"
		type="text" name="documento" placeholder="CPF" ng-required="false" value = "${documento}"
		 ng-model="documento" ng-init="documento='${documento}'" />

		
</div>