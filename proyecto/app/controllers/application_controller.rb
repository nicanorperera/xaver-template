# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  include Xexcepciones
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid,  with: :record_invalid
  rescue_from CanCan::AccessDenied,         with: :access_denied
end
