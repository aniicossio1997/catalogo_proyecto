$(document).on('turbolinks:load', function() {
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
});

$(document).on('click', ".js-card-checkbox", function() {
    //alert("Cantidad de checkboxes :"+$(".js-card-checkbox").length);
    $(".js-card-checkbox").not(this).prop("checked", false);
});

$(document).ready(function() {
    $("add_fields").
    data("association-insertion-position", 'after').
    data("association-insertion-node", 'this');
});

$('.popover-dismiss').popover({
    trigger: 'focus'
});

//Revisar
/*
 $(document).on('click', "#js-logo", 
  function(e){
    e.preventDefault();
    var formData = new FormData(this);
  }
);
*/