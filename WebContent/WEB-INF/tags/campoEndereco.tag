<%@ attribute name="classe" required="true"%>
<%@ attribute name = "endereco" required = "false"  %>


<div class="form-group" ng-class="{ 'has-error' : ${classe}Form.endereco.$invalid && !${classe}Form.endereco.$pristine }">
   <div class = "input-group">
       <span class="input-group-addon" id="basic-addon1"><i class = "glyphicon glyphicon-hand-right"></i></span>	
       <input class="form-control" 
		id="endereco" type="text" name="endereco" placeholder="Endereço"
		ng-required="false" ng-model="endereco" ng-init="endereco='${endereco}'" />

</div>
</div>