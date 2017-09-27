class Recipe < ActiveRecord::Base
  belongs_to :type
  belongs_to :ingredient
end
