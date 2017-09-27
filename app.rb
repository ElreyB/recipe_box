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

get("/recipe_list") do
  @recipes = Recipe.all
  erb(:recipe_list)
end

get("/recipes/:id") do
  @recipe = Recipe.find(params[:id])

  erb(:recipes)
end

post("/add_recipe") do
  type_id = params['type-id']
  name = params['name']
  instructions = params['instructions']
  ingredients = params['ingredients'].split(", ")
  @new_recipe = Recipe.new({name: name, instructions: instructions, type_id: type_id})
  @new_recipe.save
  # connects ingredients to new_recipe
  ingredients.each do |ingredient|
    @new_recipe.ingredients.create({name: ingredient})
  end
  # binding.pry
  if @new_recipe.save
    redirect "recipe_list"
  else
    redirect "/"
  end
end

patch("/update_ingredients/:id") do
  ingredients = params['add_ingredients'].split(", ")
  @recipe = Recipe.find(params[:id])
  ingredients.each do |ingredient|
    @recipe.ingredients.create({name: ingredient})
  end
  redirect back
end
