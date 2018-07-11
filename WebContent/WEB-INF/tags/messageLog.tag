			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>		
					<c:if test = "${not empty erro}">
						<div class = "alert alert-danger"><i class = "glyphicon glyphicon-remove"></i>  ${erro}</div> 
					</c:if>
					<c:if test = "${not empty sucesso}">
						<div class = "alert alert-success"><i class = "glyphicon glyphicon-ok"></i>  ${sucesso}</div> 
					</c:if>