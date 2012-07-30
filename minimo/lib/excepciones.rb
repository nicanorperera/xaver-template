# -*- encoding : utf-8 -*-
module Excepciones

  def record_not_found(excepcion)
    render :file => "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def access_denied(excepcion)
    redirect_to root_path, alert: excepcion.message
  end

  def record_invalid(excepcion)
    flash.now.alert = excepcion.message
    case action_name.to_sym
    when :create
      respond_to do |format|
        format.html do
          excepcion.record.imagen = nil if excepcion.record.attributes.keys.include?("imagen_uid") && excepcion.record.errors[:imagen].any?
          render :new          
        end
        format.js { render :partial => :recargar }
      end
      
    when :update
      excepcion.record.imagen = nil if excepcion.record.attributes.keys.include?("imagen_uid") && excepcion.record.errors[:imagen].any?
      render :edit
    end
  end

end