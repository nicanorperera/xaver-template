## v0.7.5
* agregados Videos
* constante `ROLES = :superadmin, :admin` , ahora es `ROLES = 'superadmin', 'admin'` , para poder usar metodo <tt>humanize<tt>
* agregado `text-align:right` a botones en Indexes de administración

## v0.7.4
* solucionado problema en heroku ("basi" en lugar de "basic")

## v0.7.3
* refactoring en heroku.rb
* en lugar de "run git push heroku master" ahora es "git :push => 'heroku master'"
* cambiadas comillas dobles por comillas simples cuando no eran necesarias

## v0.7.2
* actualizadas fotos para bootstrap

## v0.7.1
* quitado APP_CONFIG[:mail_host]
* fix problema relacionado con mail_host en environments/production.rb

## v0.7.0
* agregados estilos de DatePicker a xaver.css
* sólo pide la URL si se quiere subir la aplicación a Heroku. 
* se agregó APP_CONFIG[:mail_host]
* admin layout ahora con un menu diferente
* :label_method => :humanize, para rol de usuarios en usuarios/_form
* quitado class=> :ordenable de la tabla del index de consulta
* quitado class=> :ordenable de la tabla del index de usuario
* reemplazado admin/admin por admin/panel, y rutas, ya que es mas legible
* <h1>...</h1> en admin/panel reemplazado por <div class="page-header"><h1>...</h1></div>
* git rm ability.rb~ (archivo no utilizado)
* eliminación de algunos espacios en blanco en varios archivos.
* eliminado archivo mailers/.gitkeep

## v0.6.9
* fix error en usuarios controller de simbolo '}' flotando por ahi

## v0.6.8
* refactoring general de templates realizado por Gius

## v0.6.7
* solucionado problema con favicon

## v0.6.5
* agregado favicon.ico con forma de estrella para nuevas aplicaciones
* ahora carga correctamente el favicon y no lanza mensajes de error en heroku
* layout admin y application modificados para cargar correctamente favicon

## v0.6.4
* agregado task cargar_todo.rake

## v0.6.3
* modificado y documentado metodo de application_helper.rb <tt>thead<tt>, versión Gius

## v0.6.2
* gema foldscaf ahora está en group_gem :development
* actualizado README.md
* root_path ahora al final de archivo routes

## v0.6.1
* rails 3.2.2 en Gemfile
* agregado inicializer de squeel
* agregado inicializer de friendly_id

## v0.6.0
* utiliza foldscaf en lugar de scaf-generator

## v0.5.0
* refactoring Total. Usa Bootstrap. Es más rapido.
