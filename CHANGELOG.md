## v1.0.2

1- Cambiado 'mensaje' por 'notice' en admin_usuarios_controller
2- Eliminado metodo mensaje de admin_fotos_controller y admin_videos_controller
3- Container-Fluid en AdminController
4- Agregado Style con letras oscuras a sesiones/_form. (En Bootstrap 2.0.4 las letras se ven blancas).

## v1.0.1

1- Eliminado Xexcepciones y Sortable.
2- Eliminado views/application/_slide.
4- Show de contacto usa formato nuevo.
5- Eliminado action "secciones#index".
6- Agregado thumbnail_url a video.
7- Agregado método mensaje en ApplicationController

## v1.0.0.pre

* Assets:
1- Imagenes de Xaver.png pasa a ser xavercolor.png y xaverblanco.png
2- Javascripts Nuevos
3- Hojas de Estilo Nuevas

* Lib:
1- Xexcepciones ahora es Excepciones
2- Xbuscable ahora es Buscable, y se crea por defecto (antes no existía)
3- Sortable ahora es Ordenable
4- MiniForm no es más 'colapse' por defecto

* Helpers:
1- Separado en ApplicationHelper, ImagenesHelper y VideosHelper
2- helper_method mensajes_flash mejorado, ahora usa "&times;" en lugar de 'x'
3- Nuevo helper_method nombre_tabla(clase) #=> clase.name.tableize

* Views:
1- Agregada carpeta Kaminari, para paginación
2- admin/Usuarios fue cambiada al nuevo estilo 
3- application/_slide fue eliminado.
4- application/portada.html tiene nuevo estilo.
5- admin/_create.js adaptado a helper_method nombre_tabla
6- layouts admin y application adaptados a las nuevas vistas
7- application/sesiones/new ahora se divide en new y _form, para ser usado en el navbar.
...Aclaración:Fotos, Consultas y Videos será revisada en futuras versiones.

* Config:

1- initializers/simple_form aparece de entrada (no hace falta instalarlo)
2- locales/simple_form_es aparece de entrada

* Gemfile:
1- agregada gema quiet_assets

* Xaver.rb:
1- No llama instaladores de twitter-bootstrap-rails, simple_form ni mini_form

## v0.8.0
* agregados reset.sh & heroku.sh
* agregados estilos & javascripts de Calendario
* cambiado xaver.png por una mas simple

## v0.7.7
* refactoring helper method - Icono

## v0.7.6
* crear.js ahora permite crear elementos sin romperse al haber varias tablas

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
* <\h1>...<\/h1> en admin/panel reemplazado por <\div class="page-header"><\h1>...<\/h1><\/div>
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
