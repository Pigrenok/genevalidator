
$(document).ready(function() { 
    $("#sortable_table").tablesorter( {sortList: [[0,0]]} ); 
}); 

$(function (){
	$( ".my_popover" ).popover();
});

$(document).ready(function() { $('#sortable_table tr th').each(function(i) {
        //select all tds in this column
        var tds = $(this).parents('table')
            .find('tr td:nth-child(' + (i + 1) + ')');
        if(tds.is(':empty')) {
            //hide header
            $(this).hide();
            //hide cells
            tds.hide();
        } 
    }); 
});


$(document).ready(function() {
      $.fn.raty.defaults.path = 'css/img';
      var cells = document.getElementsByName('ranking');
      for (var i = 0; i < cells.length; i++) {
      	var sc = cells[i].getAttribute("score")*5/100
        $(cells[i]).raty({ readOnly: true, score: sc });
      }
});
