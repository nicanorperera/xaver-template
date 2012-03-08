//= require html5
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_self

$(function(){

    // Helper para que no colapsen las filas de la tabla al arrastrarlas.
    var fixHelper = function(e, ui) {
        ui.children().each(function() {
            $(this).width($(this).width());
        });
        return ui;
    };

    $( "#ordenable tbody" ).sortable({
        dropOnEmpty: false,
        handle: '.handle',
        helper: fixHelper, 
        opacity: 0.4,
        scroll:true,
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