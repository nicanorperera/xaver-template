# -*- encoding : utf-8 -*-
namespace :cargar do
  
  task :reset => :environment do
    invocar "matar:postgres"
    db :drop
    db :create
    db :migrate
  end
     
  task :todo => :environment do
    printf "\nCARGAR:TODO:\n"
    cargar :usuarios
    printf "Cargado con exito\n"
  end
    
  def cargar(nombre)
    invocar "cargar:#{nombre}"
  end
  
  def db(nombre)
    invocar "db:#{nombre}"
  end
  
  def invocar(tarea)
    printf "#{tarea.to_s.upcase}\n"
    Rake::Task[tarea].invoke
  end
end