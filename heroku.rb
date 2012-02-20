@url_name ||= ask("Escriba la URL del sitio para Heroku.")

git :init
git :add => '.'
git :commit => "-m 'Commit Inicial'"

run "heroku create #{@app_name} --stack cedar"

run "git push heroku master"

# Descomentar las lineas que crea necesarias.
# run "heroku sharing:add nicanor.perera@xaver.com.ar"
# run "heroku sharing:add sebastian.demichelis@xaver.com.ar"
# run "heroku sharing:add xavier.perera@xaver.com.ar"
# run "heroku sharing:add gustavo.molinari@xaver.com.ar"

run "heroku addons:add deployhooks:email --recipient=deploys@xaver.com.ar --subject='#{@app_name} | {{git_log}}' --body='{{user}}: {{git_log}} {{url}}'"

run "heroku addons:add custom_domains:basic"
run "heroku domains:add www.#{@url_name}"
run "heroku domains:add #{@url_name}"

run "heroku addons:upgrade logging:expanded"
run "heroku addons:add sendgrid:starter"
run "heroku addons:add memcache:5mb"


# Para que funcionen los assets en Rails 3.2.1
run "heroku plugins:install http://github.com/heroku/heroku-labs.git"
run "heroku labs:enable user_env_compile"

run 'heroku run rake db:migrate'
run 'heroku run rake cargar:usuarios'
