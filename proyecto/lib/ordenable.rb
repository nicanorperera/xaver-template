# -*- encoding : utf-8 -*-
module Ordenable

  def reordenar
    for elemento in sort_coleccion
      nuevo_orden = params[:elementos].index(elemento.id.to_s)
      elemento.update_column :orden, nuevo_orden unless (elemento.orden == nuevo_orden)
    end
    flash.now.notice = t("notice.#{action_name}")
  end

end