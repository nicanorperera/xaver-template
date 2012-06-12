# -*- encoding : utf-8 -*-
class Video < ActiveRecord::Base
  default_scope order('videos.orden')

  validates :nombre, :codigo_youtube, :presence => true
  
  alias_attribute :to_s, :nombre

  def thumbnail_url
    'http://img.youtube.com/vi/' + codigo + '/default.jpg'
  end
end
