# -*- encoding : utf-8 -*-
class Foto < ActiveRecord::Base

  # Una foto pertenece a un :propietario. Es una relación polimórfica.
  belongs_to :propietario, :polymorphic => true, :touch => true

  # Se valida la presencia del :archivo.
  validates :archivo, :presence => true, :on => :create

  # Por defecto se devuelven ordenados por :orden.
  default_scope order("fotos.orden")

  after_create :save

  # Se utiliza Dragonfly para guardar una imagen.
  image_accessor :archivo do
    # La imagen se alojará en un servidor de Amazon S3.
    storage_path { |f| "#{Rails.env}/#{propietario_type.underscore.pluralize}/#{propietario_id}/fotos/#{id}-#{rand(10000)}.#{f.format}" }
  end

  # Se crea un alias :to_s para el atributo :titulo.
  alias_attribute :to_s, :titulo

end
