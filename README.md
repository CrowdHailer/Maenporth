Maenporth
=========

TODO Write application description, add to github repo description and add github link

## Install

#### Clone the app

```
git clone git@github.com:CrowdHailer/Maenporth.git
cd Maenporth
```

#### Install Ruby Gem Dependencies

```
bundle install
```

#### Build Database

create a development and a test database

```
createdb maenporth_development
createdb maenporth_test
```

Run the migrations to the latest database schema

```
rake db:migrate:up
RACK_ENV=test rake db:migrate:up
```

#### Add Enviroment Variable

*Enviroment variables loaded with dotenv Gem*

```
touch .env
```

required *none*

## Usage

#### Run tests

```
bundle exec rake test
```

### Run locally

```
# Start application server
shotgun

# Start SASS watch and compilation
bundle exec rake sass:watch
```
