$(document).ready(function() {

	var poll_id = $('#poll_id').attr('value');

	function AddItemToList(item) {
		var addinghtml = '<li value="' + item.id + '">' + item.content +  ' <a href="/items/' + item.id + '" data-method="delete" class="delete"><i class="icon-remove"></i></a>' + '</li>';
		$('#items').append(addinghtml);
	}

	$('body').on('click','.delete', function() {
		$(this).parent().remove();
	}); //end click

	$.getJSON('/items?poll_id=' + poll_id, function(data) {
		$.each(data, function(i, item) {
			AddItemToList(item);
		}) //end each
	}); //end getJSON

	$('#addition').submit(function() {
		var formData = $(this).serialize();
		$('#error').text('')
	    $.ajax({
	      url: '/items',
	      data: formData,
	      dataType: 'JSON',
	      type: 'POST'
	    }).success(function(data){
	      AddItemToList(data);
	    }).error(function(){
				$('#error').text('You have too many items. You are only allowed to have 5.');
	    }); // end success & ajax
	    return false;
	}); //end submit
}); //end ready