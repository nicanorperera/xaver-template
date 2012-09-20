# -*- encoding : utf-8 -*-
class Admin::UsuariosController < Admin::AdminController
  load_and_authorize_resource

  def index
    @usuario = Usuario.new
  end

  def new
  end

  def edit
    @usuario = current_user unless can? :manage, Usuario
  end

  def create
    @usuario = Usuario.new params[:usuario]
    @usuario.save!
    redirect_to admin_usuarios_path, notice: mensaje
  end

  def update
    @usuario = current_user unless can? :manage, Usuario
    @usuario.update_attributes! params[:usuario]
    redirect_to edit_admin_usuario_path(@usuario), notice: mensaje
  end

  def destroy
    @id = @usuario.id
    @usuario.destroy
    notice = mensaje

    respond_to do |format|
      format.html { redirect_to admin_usuarios_path, notice: notice }
      format.js
    end
  end

end