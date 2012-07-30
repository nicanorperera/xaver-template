# -*- encoding : utf-8 -*-
class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :email,            :null => false  
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.string :rol
      t.timestamps
    end
  end
end
