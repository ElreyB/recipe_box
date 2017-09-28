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
  # connects ingredients to new_recipe
  # binding.pry
  if @new_recipe.save
    ingredients.each do |ingredient|
      @new_recipe.ingredients.create({name: ingredient})
    end
    redirect "recipe_list"
  else
    @error_type = @new_recipe
    erb(:errors)
  end
end

patch("/update_ingredients/:id") do
  ingredients = params['add_ingredients'].split(", ")
  @recipe = Recipe.find(params[:id])
  ingredients.each do |ingredient|
    new_ingredient = Ingredient.find_or_initialize_by(name: ingredient)
    if new_ingredient.id
      @recipe.ingredients.push(new_ingredient)
    else
      new_ingredient.save
      @recipe.ingredients.push(new_ingredient)
    end
  end
  redirect back
  # add viladatitons where i add
end

delete("/delete_ingredients/:id") do
  delete_ingredients = params['delete_ingredients'].split(", ")
  @recipe = Recipe.find(params[:id])
  delete_ingredients.each do |ingredient|
    this_ingredient = Ingredient.find_by name: "#{ingredient}"
    @recipe.ingredients.destroy(this_ingredient.id)
  end
  redirect back
end
