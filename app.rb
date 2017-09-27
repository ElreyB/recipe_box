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

post("/add_recipe") do
  type_id = params['type-id']
  name = params['name']
  instructions = params['instructions']
  @new_recipe =Recipe.new({name: name, instructions: instructions, type_id: type_id})
  if @new_recipe.save
    erb(:recipe_list)
  else
    redirect "/"
  end
end
