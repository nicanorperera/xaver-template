// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_self


$(function(){

  $("#flash").click(function(){
    $(this).slideUp(500);
  });

  $(".mostrar-formulario").toggle(function(){
    $(this).text("Ocultar formulario");
    $(".agregar-foto").fadeIn(250);
    $("form.mini").slideDown();
  }, function(){
    $(this).text("Mostrar formulario");
    $(".agregar-foto").fadeOut(250);
    $("form.mini").slideUp();
  });

  $("section.ordenable").sortable({
    dropOnEmpty: false,
    handle: ".arrastrable",
    cursor: "crosshair",
    items: "article",
    opacity: 0.4,
    scroll: true,
    update: function(){
      $.ajax({
        type: 'post',
        data: $(this).sortable('serialize'),
        dataType: 'script',
        url: $(".url").val()
      })
    }
  });

  $('input.calendario').datepicker({
    showAnim: "slideDown",
    format: "dd/mm/yyyy"
  });

});