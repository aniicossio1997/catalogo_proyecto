$(document).on('turbolinks:load', function () {
  $("#menu-toggle").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});

$(document).on('click', ".js-card-checkbox", function(){
    //alert("Cantidad de checkboxes :"+$(".js-card-checkbox").length);
    $(".js-card-checkbox").not(this).prop("checked", false);
});

$(document).ready(function() {
    $("a.add_fields").
      data("association-insertion-position", 'after').
      data("association-insertion-node", 'this');
});
