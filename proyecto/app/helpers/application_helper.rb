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
  
  def icono(nombre, estilo = :normal)
    c = "icon-#{nombre} "
    c += 'icon-white ' if estilo == :blanco
    content_tag :i, '',:class => c
  end

  # Retorna todos los mensajes Flash con formato de Twitter Bootstrap
  #
  #     <div class='alert alert-success fade in'>
  #       Este es el mensaje de tipo :notice
  #       <a href=# class='close' data-dismiss='alert'>x</a>
  #     </div>
  #
  def mensajes_flash
    flash.collect do |id, mensaje|
      content_tag :div, (link_to 'x','#', :class => 'close', 'data-dismiss' => "alert" ) + content_tag(:p, mensaje), :class => "alert alert-#{flash_type(id)} fade in"
    end.join.html_safe
  end

  def flash_type(type)
    case type
    when :alert   then "warning"
    when :notice  then "info"
    else type.to_s
    end
  end

  # Retorna el header de la tabla. Ej: <%= thead(:parametro_uno, :parametro_dos )%>, retorna:
  #
  #     <thead>
  #       <tr>
  #         <th>Parametro Uno</th>
  #         <th>Parametro Dos</th>
  #       </tr>
  #     </thead>
  #
  def thead(*args)
    content_tag :thead, content_tag(:tr, args.map { |arg| content_tag :th, arg.to_s.humanize }.join.html_safe)
  end

end
