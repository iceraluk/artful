# Artful

## Ruby version
Ruby 2.2.4

If you are using RVM you can do:

````
  $ rvm install 2.2.4
````

## Rails version
Rails 4.0.8
Instalation guides: http://installrails.com

## System dependencies
## Postgresql
#### MAC OS
Instalation guides: https://wiki.postgresql.org/wiki/Detailed_installation_guides

#### Ubuntu
````
  $ sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
  $ wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
  $ sudo apt-get update
  $ sudo apt-get install postgresql-common
  $ sudo apt-get install postgresql-9.3 libpq-dev
````
## Configuration

## Database creation

Create and migrate database
````
  $ rake db:create
  $ rake db:migrate
````

Then seed the database
````
  $ rake db:seed
````


## How to run the test suite
Migrate test database
````
  $ rake db:test:prepare
````
Run tests
````
  $ rspec spec
````
