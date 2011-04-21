// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


//category expand/minimize
jQuery('.product_list').hide();

jQuery('.expander').removeClass('expanded').addClass('.minimized').html("[-]");

jQuery('.expander').click(function() {
	alert('clicked');
});

