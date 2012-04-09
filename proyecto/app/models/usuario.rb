# -*- encoding : utf-8 -*-
class Usuario < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :email, :password, :password_confirmation, :rol

  validates :password, :confirmation => true
  validates :password, :presence => true, :on => :create
  validates :username, :presence => true, :uniqueness => true
  validates :rol, :presence => true

  ROLES = 'superadmin', 'admin'

  def rol_es?(un_rol)
    rol == un_rol.to_s
  end

  def roles_que_puede_crear
    case rol.to_sym
    when :superadmin
      ROLES
    when :admin
      ROLES - [:superadmin]
    end
  end

  alias_attribute :to_s, :username

end
