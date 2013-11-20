$(document).ready(function(){
	var activebtnvalue = $("#who_are_you").find("button.active").addClass('btn-primary')
})

$(document).on("click","#who_are_you button",function(){
	$('.who_btn').removeClass('active btn-primary')
	$(this).addClass("active btn-primary")
	$('#user_role').val($(this).text())
})

