<%@ attribute name = "classe" required = "true"  %>
<%@ attribute name = "nameButton" required = "true"  %>


<button ng-disabled="${classe}.$invalid" class="btn btn-primary"><i class = "glyphicon glyphicon-floppy-disk"></i> ${nameButton} ${classe}</button>
