# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(usuario)

    usuario ||= Usuario.new
    can :update, usuario

    if usuario.rol_es? :superadmin
      can :manage, :all
    end

    if usuario.rol_es? :admin
      # can :manage, Usuario
    end

  end
end
