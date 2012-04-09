# -*- encoding : utf-8 -*-
class Admin::VideosController < Admin::AdminController
  load_and_authorize_resource
  include Sortable

  def index
    @video = Video.new
  end

  def new
  end
  
  def create
    @video = Video.new params[:video]
    @video.save!
    notice = mensaje

    respond_to do |format|
      format.html { redirect_to admin_videos_path, notice: notice }
      format.js { @elemento = @video }
    end
  end

  def edit
  end
  
  def update
    @video.update_attributes! params[:video]
    redirect_to edit_admin_video_path(@video), notice: mensaje
  end

  def destroy
    @id = @video.id
    @video.destroy
    notice = mensaje

    respond_to do |format|
      format.html { redirect_to admin_videos_path, notice: notice }
      format.js
    end
  end
  
  private

  def mensaje
    flash.now.notice = t("notice.#{action_name}")
  end

  def sort_coleccion
    Video.all
  end

end
