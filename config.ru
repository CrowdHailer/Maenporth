# require File.expand_path("../app/application.rb", __FILE__)
require 'scorched'
module Maenporth
  class App < Scorched::Controller
    get '/' do
      'hello'
    end
  end

end


run Maenporth::App
