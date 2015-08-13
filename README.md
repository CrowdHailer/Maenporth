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

required
- ADMIN_EMAIL
- BUGSNAG_API_KEY
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- MANDRILL_USERNAME
- MANDRILL_APIKEY
- S3_BUCKET_NAME

##### Amazon
Account under Richards management  
Account URL: https://039877457256.signin.aws.amazon.com/console
Peter username: peter-saxton


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
