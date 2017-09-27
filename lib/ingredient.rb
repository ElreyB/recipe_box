class Ingredient < ActiveRecord::Base
  has_many :recipes
  has_many :types, through: :recipes  
end
