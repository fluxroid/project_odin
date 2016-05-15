$(document).ready(function() {
	makeGrid(16);
	var color = false;
	var shades = false;
	$('#clear').on('click', function(){
		$('div.grid').remove();
		do {
		var p = parseInt(prompt("How many squares?"));
		}
		while (p <= 0);
		makeGrid(p);
	});

	$('#color').on('click', function(){
		if ($('#shades').hasClass('highlighted')){
			$('#shades').removeClass('highlighted');
			shades = false;
		}
		$('#color').toggleClass('highlighted');
		color? color = false : color = true;
	});

	$('#shades').on('click', function(){
		if ($('#color').hasClass('highlighted')){
			$('#color').removeClass('highlighted');
			color = false;
		}
		$('#shades').toggleClass('highlighted');
		shades? shades = false : shades = true;
	})
		
	$('#container').on({
		mouseenter: function () {
			if (color){
				$(this).css('background-color', generateColor());
			}
			else if (shades){
				var current = $(this).css('background-color');
				$(this).css('background-color', darken(current));
			}
			else{
				$(this).css('background-color', 'white');
			}
		},
	}, '.square');
})

function makeGrid(size){
	$('<div class="grid"></div>').appendTo('#container');
	for (i = 0; i<size; i++) {
		var row = i.toString() + "row";
		$('<div class='+ row + '></div').appendTo('.grid');
		for (j = 0; j<size; j++) {
			$('<div class="square"></div>').appendTo('.'+row);
		}
	}
	var value = (800/size-4);
	var d = value.toString()+"px";
	var e = (value+4).toString()+"px";
	$('.square').css({"height":d,"width":d});
	$('div[class*="row"]').css({"height":e})
}

function generateColor(){
	return 'rgb(' + 
		(Math.floor(Math.random() * 256)) + ',' + 
		(Math.floor(Math.random() * 256)) + ',' + 
		(Math.floor(Math.random() * 256)) + ')';

}

function darken(color){
	var before = color.match(/\d+/g);
	var red = parseInt(before[0]) - ((parseInt(before[0]) > 25)? 25: parseInt(before[0]));
	var green = parseInt(before[1]) - ((parseInt(before[1]) > 25)? 25: parseInt(before[1]));
	var blue = parseInt(before[2]) - ((parseInt(before[2]) > 25)? 25: parseInt(before[2]));
	var rgb = 'rgb(' + red + ',' + green + ',' + blue + ')';
	return rgb;
}