# -*- encoding : utf-8 -*-
module ApplicationHelper

  # Retorna todos los mensajes Flash con formato de Twitter Bootstrap
  def mensajes_flash
    content_tag :div, flash.collect { |id, mensaje| content_tag :div, (link_to raw("&times;"),'#', :class => 'close', 'data-dismiss' => "alert" ) + mensaje, :class => "alert alert-#{flash_type(id)} fade in" }.join.html_safe, :id => :flash
  end
  
  def flash_type(type)
    case type
    when :alert   then "warning"
    when :notice  then "info"
    else type.to_s
    end
  end

  # Retorna el header de la tabla. 
  def thead(*args)
    content_tag :thead, content_tag(:tr, args.map { |arg| content_tag :th, arg.to_s.humanize }.join.html_safe)
  end

  def fecha(una_fecha, opciones = {})
    una_fecha.present? ? l(una_fecha, opciones) : "-"
  end

  def nombre_tabla(clase)
    clase.name.tableize
  end
  
end