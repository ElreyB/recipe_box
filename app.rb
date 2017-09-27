require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'pry'

types = ["Veggie", "Chicken", "Seafood", "Beef", "Lamb"]
types.each do |type|
  Type.create({name: type})
end

get("/") do
  @types = Type.all
  erb(:index)
end
