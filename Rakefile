# setup as development enviroment unless otherwise specified
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)

# Load enviromental variables
# require 'dotenv/tasks'
# Dotenv.load

Dir.glob('tasks/**/*.rake').each(&method(:import))

# Think these really are not necessary
# require 'bugsnag'
# require "bugsnag/tasks"
# require_relative './config/bugsnag.rb'
