# -*- encoding : utf-8 -*-
class Consulta < ActiveRecord::Base
  default_scope order("created_at desc")
  after_create :enviar_email
  
  validates :nombre, :presence => true
  validates :telefono, :presence => { :message => I18n.t("errors.messages.telefono_o_email") }, :if => "email.blank?"
  validates :email, :presence => { :message => I18n.t("errors.messages.telefono_o_email") }, :if => "telefono.blank?"

  def nombre_completo
    "#{nombre}, #{apellido}"
  end

  alias_method :to_s, :nombre_completo

  def enviar_email
    Notificador.consulta(self).deliver
  end

end