class Recipe < ActiveRecord::Base
  belongs_to :type
  has_and_belongs_to_many :ingredients

  validates(:name, {:presence => true})
  before_save(:capitalizes_name, {})

  private

  def capitalizes_name
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end
end
