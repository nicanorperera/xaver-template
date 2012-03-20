# -*- encoding : utf-8 -*-
class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :titulo
      t.string :archivo_uid, :archivo_name

      t.integer :orden
      t.references :propietario, :polymorphic => true
      t.timestamps
    end
    add_index :fotos, [:propietario_id, :propietario_type]
  end
end
