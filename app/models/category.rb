class Category < ApplicationRecord
  has_many :bird_cats
  has_many :birds, through: :bird_cats

  #scope :bird_title, -> { 
  #	joins(bird_cats: :bird).where(birds: {title: "Yellow bird"})
  #}

end
