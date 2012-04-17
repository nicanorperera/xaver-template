//= require jquery
//= require jquery-ui
//= require jquery.min
//= require jquery_ujs
//= require twitter/bootstrap
//= require ui.min
//= require date
//= require daterangepicker.jQuery
//= require datepicker.es
//= require ui.timepicker.addon
//= require_self

$(function(){

  $("a[href='" + window.location.pathname + "']").parent().addClass('active');

  $.datepicker.setDefaults({
    showAnim: "slideDown",
    format: "dd/mm/yyyy"
  });

  $('input.calendario').datetimepicker({
    minDate: 0
  });

  $('#mini').on('shown', function () {
    $(this).find("input:not(:hidden):first").focus();
  });

  // Helper para que no colapsen las filas de la tabla al arrastrarlas.
  var fixHelper = function(e, ui) {
    ui.children().each(function() {
      $(this).width($(this).width());
    });
    return ui;
  };

  $("table.ordenable tbody").sortable({
    dropOnEmpty: false,
    handle: '.handle',
    helper: fixHelper, 
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
  }).disableSelection();

  $('input.calendario').datepicker({
    showAnim: "slideDown",
    format: "dd/mm/yyyy"
  });

});
