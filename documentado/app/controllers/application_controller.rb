# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  include Excepciones
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid,  with: :record_invalid
  rescue_from CanCan::AccessDenied,         with: :access_denied

  private

  def mensaje
    flash.now.notice = t("notice.#{action_name}")
  end
end