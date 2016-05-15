$(document).ready(function() {
	makeGrid(16);
	var color = false;
	$('#clear').on('click', function(){
		$('div.grid').remove();
		do {
		var p = parseInt(prompt("How many squares?"));
		}
		while (p <= 0);
		makeGrid(p);
	});

	$('#color').on('click', function(){
		$('#color').toggleClass('highlighted');
		color? color = false : color = true;
	});
		
	$('#container').on({
		mouseenter: function () {
			if (color){
				$(this).css('background-color', generateColor());
			}
			else{
				$(this).css('background-color', 'black');
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