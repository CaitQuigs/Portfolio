$(document).ready(function() {
	const $projectBox = $(.'project-box')

	$projectBox.on('mouseenter', () => {
		$(.'slide-cover').slideDown(); //show hover 
	})
	$projectBox.on('mouseleave', () => {
		$(.'slide-cover').slideUp(); // leave hover
	});
	$projectbox.on('click', () => {
		//launch modal
	});
})