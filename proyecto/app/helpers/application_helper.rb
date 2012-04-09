# -*- encoding : utf-8 -*-
module ApplicationHelper

  include MiniForm

  def imagen(imagen, tamano, opciones = "", html_options = {})
    image_tag imagen_path(imagen, tamano, opciones), html_options
  end
  
  def imagen_path(imagen, tamano, opciones = "")
    imagen.present? ? imagen.thumb(tamano + opciones).url : asset_path("default-#{tamano}.png")
  end
  
  def foto(foto, tamano = "200x150", opciones = "")
    imagen foto.try(:archivo), tamano, opciones
  end

  def video(codigo, tamano_x = "550", tamano_y = "450")
    content_tag :iframe, nil, :width => tamano_x, :height => tamano_y, :src => "http://www.youtube.com/embed/#{codigo}?rel=0", :frameborder => 0, :allowfullscreen => true
  end  
  
  def icono(nombre, estilo = :normal)
    c = "icon-#{nombre} "
    c += 'icon-white ' if estilo == :blanco
    content_tag :i, '', :class => ["icon-#{nombre}", ("icon-white" if estilo == :blanco)]
  end

  # Retorna todos los mensajes Flash con formato de Twitter Bootstrap
  def mensajes_flash
    content_tag :div, flash.collect { |id, mensaje| content_tag :div, (link_to 'x','#', :class => 'close', 'data-dismiss' => "alert" ) + mensaje, :class => "alert alert-#{flash_type(id)} fade in" }.join.html_safe, :id => :flash
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

end
