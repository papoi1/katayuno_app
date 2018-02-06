class Kata < ApplicationRecord
  validates :title, :description,  presence: true

  has_many :belts
end
