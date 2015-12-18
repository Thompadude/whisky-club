$("#toggle").click(function(){
    $("#fade").fadeToggle("slow");
});

// Om man vill sätta färg på faden.. sätt id på första div klassen isåfall (<div class="btn-group-vertical">)
$("#test").click(function() {
    $(this).css('background-image','none')
    .css('background-color','#AAAAAA')
});