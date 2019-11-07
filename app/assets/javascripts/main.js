$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});

$(document).on('click', ".js-card-checkbox", function(){
    //alert("Cantidad de checkboxes :"+$(".js-card-checkbox").length);
    //$(".js-card-checkbox").not(this).prop("checked", false);
});