# -*- encoding : utf-8 -*-
class Admin::AdminController < ApplicationController
  before_filter :require_login
  layout "admin"
  helper_method :admin_polymorphic_path, :new_admin_polymorphic_path, :edit_admin_polymorphic_path

  # Este método proporciona un "atajo" al método polymorphic_path dentro del namespace :admin.
  def admin_polymorphic_path(propietario, recurso = nil, action = nil)
    polymorphic_path [action, :admin, propietario, recurso]
  end

  # Este método proporciona un "atajo" al método new_polymorphic_path dentro del namespace :admin.
  def new_admin_polymorphic_path(propietario, recurso = nil)
    new_polymorphic_path [:admin, propietario, recurso]
  end

  # Este método proporciona un "atajo" al método edit_polymorphic_path dentro del namespace :admin.
  def edit_admin_polymorphic_path(propietario, recurso = nil)
    edit_polymorphic_path [:admin, propietario, recurso]
  end

end