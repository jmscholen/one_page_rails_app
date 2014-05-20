$(function(){
	// $('form#new_task').on('submit', function(){
	// 	var params = $(this).serialize();
	// 	$.ajax({
	// 		url: $(this).attr('action'),
	// 		type: "POST",
	// 		data: params,
	// 		dataType: "JSON"
	// 	}).success(function(json){
	// 		var name = json.task_name;
	// 		console.log(json);

	// 		$('tbody').append('<tr>' + name + '</tr>');
	// 	});
	// 	return false;
	// });
// REQUIRES REMOTE: TRUE IN THE FORM_FOR
	$('form#new_task').on('ajax:complete', function(event, data, status, xhr){
		var new_task = $.parseJSON(data.responseText),
			name = new_task.task_name;
			task_id = new_task.id
			console.log(new_task)
		$('#help').append('<tr><td><input id="completed" name="completed" type="checkbox" value="1"></td>' + '<td>' + name + '</td>' + '<td><a href="/tasks/' + task_id + '/edit">Edit</a></td>' + '<td><a data-method="delete" href="/tasks/' + task_id + '" rel="nofollow">Delete</a></td></tr>');
	});


	//$('a[href~='edit']').on('click', function(){
	//	$('myModal').show('slow');
	//});

});




		