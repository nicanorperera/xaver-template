# -*- encoding : utf-8 -*-
class Admin::FotosController < Admin::AdminController
  include Ordenable
  # Debe cambiar :producto por el modelo que corresponda
  load_resource :producto, :instance_name => :propietario
  load_and_authorize_resource :through => :propietario, :shallow => true

  def index
    @foto = Foto.new
  end

  def edit
  end

  def update
    @foto.update_attributes! params[:foto]
    redirect_to edit_admin_foto_path(@foto), notice: mensaje
  end

  def editar
    redirect_to admin_polymorphic_path(@propietario, :fotos), notice: notice if @fotos.empty?
  end

  def actualizar
    @propietario.fotos.update params[:elementos].keys, params[:elementos].values
    @propietario.fotos.where(:archivo_uid => nil).destroy_all
    redirect_to admin_polymorphic_path(@propietario, :fotos, :editar), notice: mensaje
  end

  def destroy
    @id = @foto.id
    titulo = @foto.titulo
    @foto.destroy
    notice = mensaje

    respond_to do |format|
      format.html { redirect_to admin_polymorphic_path(@foto.propietario, :fotos), notice: notice }
      format.js
    end
  end

  private

  def sort_coleccion
    @propietario.fotos
  end
end
