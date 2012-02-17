# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  def imagen(imagen, tamano, opciones = "", html_options = {})
    image_tag imagen_path(imagen, tamano, opciones), html_options
  end
  
  def imagen_path(imagen, tamano, opciones = "")
    imagen.present? ? imagen.thumb(tamano + opciones).url : asset_path("default-#{tamano}.png")
  end
  
  def foto(foto, tamano = "200x150", opciones = "")
    imagen foto.try(:archivo), tamano, opciones
  end
  
  # Retorna todos los mensajes Flash con el siguiente formato
  #
  #   <article class='notice'>
  #     <div>
  #       Este es el mensaje de tipo :notice
  #     </div>
  #   </article>
  #
  def mensajes_flash
    flash.collect do |id, mensaje|
      content_tag :article, content_tag(:div, mensaje), :class => id
    end.join.html_safe
  end
    
end
