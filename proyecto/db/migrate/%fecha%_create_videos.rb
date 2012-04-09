# -*- encoding : utf-8 -*-
class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :codigo_youtube
      
      t.integer :orden
      t.timestamps
    end
  end
end
