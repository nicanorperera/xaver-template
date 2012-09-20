# -*- encoding : utf-8 -*-
class Admin::ConsultasController < Admin::AdminController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def destroy
    @id = @consulta.id
    @consulta.destroy
    notice = mensaje

    respond_to do |format|
      format.html { redirect_to admin_consultas_path, notice: notice }
      format.js
    end
  end

end