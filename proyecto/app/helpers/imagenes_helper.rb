# -*- encoding : utf-8 -*-
module ImagenesHelper

  def imagen(imagen, tamano, opciones = "", html_options = {})
    clases = html_options[:class]
    html_options.merge! :class => [clases, :placeholder] if imagen.nil?
    image_tag imagen_path(imagen, tamano, opciones), html_options
  end
  
  def imagen_path(imagen, tamano, opciones = "")
    imagen.present? ? imagen.thumb(tamano + opciones).url : asset_path("default-#{tamano}.png")
  end
  
  def foto(foto, tamano = "200x150", opciones = '')
    imagen foto.try(:archivo), tamano, opciones
  end
  
  def lytebox_foto(foto, tamano, opciones = '', grupo = nil, html_options = {})
    grupo ||= foto.propietario_id
    html_options.reverse_merge! :title => foto.titulo
    html_options.merge! :data => { :lyte_options => "group:#{grupo}", :title => foto.titulo }, :class => :lytebox
    link_to foto(foto, tamano, opciones), imagen_path(foto.archivo, "900x"), html_options
  end
  
  def icono(nombre, estilo = :normal)
    content_tag :i, '', :class => ["icon-#{nombre}", ("icon-white" if estilo == :blanco)]
  end

  def texto_a_imagen(texto, size = "16", color = "black", tipografia = "Helvetica")
    Dragonfly[:images].generate(:text, texto, :font_size => size, :font_family => tipografia, :color => color).thumb("500x100>").url
  end
  
end