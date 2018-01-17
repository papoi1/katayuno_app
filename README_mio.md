# MiniRun RAILS

DRY: Don't repeat yourself
MVC: Moelo-Vista-Controlador

https://trello.com/b/KyMv9Hyh/katayuno-rails-app

---
1. Crear Dockerfile

```
FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev node.js

RUN mkdir /myapp
WORKDIR /myapp

RUN gem install bundler --pre
RUN bundle install

ADD . /myapp
```


2. Crear docker-compose.yml

```
version: '3'
services:
    web:
        build: .
        volumes:
          - .:/myapp
        ports:
          - "3000:3000"
```


3. Ejecutar: `docker-compose up --build`
4. Ejecutar: `docker-compose run web bash` (web es el nombre del servicio dado en docker-compose.yml)

1. `gem install rails`
2. `rails -v`
3. crear proyecto `rails new /myapp -T` (se instalan las dependencias de rails)


4. `rails db:migrate`
5. `rails -s -p 3000 -b '0.0.0.0'`

6. Añadir al docker-compose

```  
  command: bundle exec rails db:migrate
  command: bundle exec rake db:seed
  command: bundle exec rails s -p 3000 -b '0.0.0.0'
  ```

7. Añadir RSPEC en Gemfile
```
group :test do
gem 'rspec-rails'
end
```
8. docker-compose up --build
9. docker-compose exec web bash
10. rails generate rspec:install

11. en el .rspec que se crea, añadir:
```
--require spec_helper
--format documentation
--order random
--color
```
