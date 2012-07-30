# -*- encoding : utf-8 -*-
module Buscable

  # Normaliza el texto recibido para realizar búsquedas.
  # No distingue tildes y mayúsculas.
  def self.normalizar(texto = "")
    texto.to_s.downcase.tr("áéíóú%", "aeiou ")
  end

end
