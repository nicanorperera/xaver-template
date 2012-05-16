# -*- encoding : utf-8 -*-
module VideosHelper

  def video(codigo, tamano_x = "550", tamano_y = "450")
    content_tag :iframe, nil, :width => tamano_x, :height => tamano_y, :src => "http://www.youtube.com/embed/#{codigo}?rel=0", :frameborder => 0, :allowfullscreen => true
  end  
  
end