//= require jquery
//= require twitter/bootstrap/bootstrap-alert
//= require twitter/bootstrap/bootstrap-collapse	
//= require twitter/bootstrap/bootstrap-dropdown	
//= require twitter/bootstrap/bootstrap-modal
//= require twitter/bootstrap/bootstrap-transition
//= require_self

$(function(){

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

    $('#fecha').datepicker()

});