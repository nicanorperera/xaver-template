@raiz = File.expand_path(File.join(File.dirname(__FILE__)))

@proyecto = File.join(@raiz, 'proyecto')

@url_name = ask("Escriba la URL del sitio:")

remove_file "Gemfile"
remove_file "README"

remove_file "app/assets/images/rails.png"
remove_file "app/assets/javascripts/application.js"
remove_file "app/views/layouts/application.html.erb"
remove_file "app/helpers/application_helper.rb"

remove_file "config/application.rb"
remove_file "config/database.yml"
remove_file "config/environments/production.rb"
remove_file "config/initializers/inflections.rb"
remove_file "config/routes.rb"
remove_file "config/locales/en.yml"

remove_file "public/index.html"
remove_file "public/robots.txt"

# Copia Recursivamente todos los archivos de la carpeta proyecto.
directory @proyecto, "../#{app_name}"

# Instala Gemas: 
run 'bundle install'

# Creación y Migración de la Base de Datos
rake 'db:create', :env => 'development'
rake 'db:migrate'

# Genera Migración de Consulta
generate(:model, "consulta", "nombre", "apellido", "telefono", "email", "direccion", "localidad", "mensaje:text", "--skip")

# Instala Simple_form: 
generate 'simple_form:install'

# Instala sorcery con modelo 'Usuario'
generate 'sorcery:install --model Usuario'

# Modifica el modelo 'Usuario'
remove_file 'app/models/usuario.rb'
copy_file File.join(@raiz, 'archivos', 'usuario.rb'), 'app/models/usuario.rb'

#Guarda el tiempo actual en una variable y copia el archivo de migración create_fotos.rb
@tiempo = (Time.now - 10).utc.strftime("%Y%m%d%H%M%S")
copy_file File.join(@raiz, 'archivos', 'create_fotos.rb'), "db/migrate/#{@tiempo}_create_fotos.rb"

# Crea Migracion para agregar Rol a Usuario
generate(:migration, 'AddRolToUsuarios rol:string')

# Migración y Creación de usuarios.
rake 'db:migrate VERSION=0'
rake 'db:migrate'
rake 'cargar:usuarios'

# Subir aplicación a Heroku y Configurar.
if yes? 'Desea subir aplicacion a Heroku? (y/n)'
  apply File.join( @raiz, 'heroku.rb' )
end
