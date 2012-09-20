# -*- encoding : utf-8 -*-
class ConsultasController < ApplicationController
  load_resource
  
  def new
  end

  def create
    @consulta = Consulta.new params[:consulta]
    @consulta.save!
    redirect_to contacto_path, notice: t("notice.consulta_enviada")
  end
end