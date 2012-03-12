namespace :cargar do
  task :todo => :environment do
     tareas = %w[usuarios] # Agregar nombres de tasks
     tareas.each do |t|
      Rake::Task[ "cargar:#{t}" ].execute    
    end
  end
end
