#!/bin/bash
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate
heroku run rake cargar:todo
heroku restart
passenger start
