# -*- encoding : utf-8 -*-
namespace :cargar do
  task :usuarios => :environment do
    Usuario.create! :rol => :superadmin, :email => "gustavo.molinari@xaver.com.ar"    , :password => "123456", :password_confirmation => "123456"
    Usuario.create! :rol => :superadmin, :email => "xavier.perera@xaver.com.ar"       , :password => "123456", :password_confirmation => "123456"
    Usuario.create! :rol => :superadmin, :email => "sebastian.demichelis@xaver.com.ar", :password => "123456", :password_confirmation => "123456"
    Usuario.create! :rol => :superadmin, :email => "nicanor.perera@xaver.com.ar"      , :password => "123456", :password_confirmation => "123456"
  end
end