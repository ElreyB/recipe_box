class Type < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients, through: :recipes

  validates(:name, {:uniqueness => true})
end
