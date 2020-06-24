class BirdCat < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :bird, optional: true
end
