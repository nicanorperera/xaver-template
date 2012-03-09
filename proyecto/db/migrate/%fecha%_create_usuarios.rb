# -*- encoding : utf-8 -*-
class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :username,         :null => false  
      t.string :email,            :default => nil 
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.string :rol
      t.timestamps
    end
  end
end
