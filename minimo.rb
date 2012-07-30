@raiz = File.expand_path(File.join(File.dirname(__FILE__)))
@minimo = File.join(@raiz, 'minimo')
@heroku   = File.join(@raiz, 'heroku.rb')

@fecha ||= Time.now
def fecha
 @fecha  += 1
 @fecha.utc.strftime("%Y%m%d%H%M%S")
end

remove_file "Gemfile"
remove_file "README"

remove_file "app/assets/images/rails.png"
remove_file "app/assets/javascripts/application.js"
remove_file "app/helpers/application_helper.rb"
remove_file "app/views/layouts/application.html.erb"
remove_file "app/controllers/application_controller.rb"

remove_file "config/application.rb"
remove_file "config/database.yml"
remove_file "config/environments/production.rb"
remove_file "config/initializers/inflections.rb"
remove_file "config/routes.rb"
remove_file "config/locales/en.yml"

remove_file "public/index.html"
remove_file "public/favicon.ico"
remove_file "public/robots.txt"

remove_dir "vendor"
remove_dir "test"
remove_dir "doc"

# Copia Recursivamente todos los archivos de la carpeta proyecto.
directory @minimo, "../#{app_name}"

# Instala Gemas: 
run 'bundle install'

# Creación, Migración y carga de la Base de Datos
rake 'db:create', :env => 'development'
rake 'db:migrate'
rake 'cargar:usuarios'

# Subir aplicación a Heroku y Configurar.
if yes? 'Desea subir aplicacion a Heroku? (y/n)'
  apply @heroku
end
