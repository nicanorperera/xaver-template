# -*- encoding : utf-8 -*-
class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :email
      t.string :direccion
      t.string :localidad
      t.text   :mensaje

      t.timestamps
    end
  end
end

