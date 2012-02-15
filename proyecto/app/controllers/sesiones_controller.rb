# -*- encoding : utf-8 -*-
class SesionesController < ApplicationController
  layout false

  def index
    # Cambiar root_path por otro Path.
    redirect_to (logged_in? ? root_path : root_path), notice: notice, alert: alert
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new params[:usuario]
    login @usuario.username, @usuario.password
    if logged_in?
      redirect_to sesiones_path, notice: t("notice.sesion_iniciada")
    else
      flash.alert = t("alert.sesion_no_iniciada")
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: notice, alert: alert
  end

end

