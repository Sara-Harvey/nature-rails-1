class Bird < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bird_cats
  has_many :categories, through: :bird_cats

  validates :title, presence: true
  validates :title, length: { minimum: 2 }
  validates :content, length: { maximum: 500 }

  scope :search_category, -> (category_name) { 
    joins(bird_cats: :category).where("name LIKE ?", category_name)
  }

#joins(bird_cats: :category).where("category_name LIKE ?", category_name)

=begin
  scope :search_category, -> (category_name) { 
    joins(bird_cats: :category).where(categories: "name = ?", category_name)
  }
=end

  #scope :category_name, -> { 
  #  joins(bird_cats: :category).where(categories: {name: "Air"})
  #}

end
