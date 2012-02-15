require File.join(File.dirname(__FILE__), 'core.rb')

remove_file "Gemfile"
remove_file "README"

remove_file "app/assets/images/rails.png"
remove_file "app/assets/javascripts/application.js"
remove_file "app/controllers/application_controller.rb"
remove_file "app/views/layouts/application.html.erb"

remove_file "config/application.rb"
remove_file "config/database.yml"
remove_file "config/environments/production.rb"
remove_file "config/initializers/inflections.rb"
remove_file "config/routes.rb"

remove_file "public/index.html"
remove_file "public/robots.txt"

@url_name = corroborar("Escriba la URL del sitio:")

# Copia Recursivamente todos los archivos de la carpeta proyecto.
directory local_path("proyecto"), "../#{app_name}"

# - Gemfile
# - push.sh

# - app/assets/javascripts/*
# - app/assets/stylesheets/*
# - app/controllers/application_controller.rb
# - app/controllers/sesiones_controller.rb
# - app/controllers/admin/admin_controller.rb
# - app/controllers/admin/usuarios_controller.rb
# - app/models/ability.rb

# - app/views/application/_flash.html.erb
# - app/views/application/_slide.html.erb
# - app/views/admin/admin/*
# - app/views/admin/usuarios/*
# - app/views/layouts/*
# - app/views/sesiones/new.html.erb

# - config/database.yml
# - config/routes
# - config/application.rb (Como Template)
# - config/environments/production
# - config/initializers/dragonfly.rb
# - config/initializers/inflections.rb
# - config/locales/es.yml

# - lib/sortable
# - lib/xexcepciones

# - lib/tasks/crear_usuarios.rake

# - vendor/assets/images/*
# - vendor/assets/javascripts/*
# - vendor/assets/stylesheets/*

# Instala Gemas: 
run 'bundle install'

# Creación y Migración de la Base de Datos
rake "db:create", :env => 'development'
rake "db:migrate"

# Instala Simple_form: 
generate 'simple_form:install'

# Instala sorcery con modelo 'Usuario'
generate 'sorcery:install --model Usuario'
remove_file 'app/models/usuario.rb'

# Modifica el modelo 'Usuario'
copy_file local_path('archivos/usuario.rb'), 'app/models/usuario.rb'

# Crea Migracion para agregar Rol a Usuario
generate(:migration, "AddRolToUsuarios rol:string")

# Migración y Creación de usuarios.
rake "db:migrate VERSION=0"
rake "db:migrate"
rake "cargar:usuarios"

# Subir aplicación a Heroku y Configurar.
if yes? "Desea subir aplicacion a Heroku? (y/n)"
  apply "#{dirname}/heroku.rb"
end
