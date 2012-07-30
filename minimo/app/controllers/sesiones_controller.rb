# -*- encoding : utf-8 -*-
class SesionesController < ApplicationController

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new params[:usuario]
    login @usuario.email, @usuario.password
    if logged_in?
      redirect_to admin_root_path, notice: t("notice.sesion_iniciada")
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