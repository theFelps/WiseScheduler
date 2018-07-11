jQuery(function($){
function supportsPlaceholder(){
	return "placeholder" in document.createElement("input") &&
			"placeholder" in document.createElement("textarea");
}
if(!supportsPlaceholder()){
	$("html").addClass("no-placeholder");
}

});