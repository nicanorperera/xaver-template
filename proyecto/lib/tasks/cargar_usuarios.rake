# -*- encoding : utf-8 -*-
namespace :cargar do
  task :usuarios => :environment do
    Usuario.create! :rol => :superadmin, :username => "gustavo.molinari", :password => "123456", :password_confirmation => "123456", :email => "gustavo.molinari@xaver.com.ar"
    Usuario.create! :rol => :superadmin, :username => "xavier.perera", :password => "123456", :password_confirmation => "123456", :email => "xavier.perera@xaver.com.ar"
    Usuario.create! :rol => :superadmin, :username => "sebastian.demichelis", :password => "123456", :password_confirmation => "123456", :email => "sebastian.demichelis@xaver.com.ar"
    Usuario.create! :rol => :superadmin, :username => "nicanor.perera", :password => "123456", :password_confirmation => "123456", :email => "nicanor.perera@xaver.com.ar"
  end
end

