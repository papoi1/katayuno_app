class Belt < ApplicationRecord
  belongs_to :kata

  def self.find_kata_id(belt)
    find(belt).kata.id
  end

  def inline()
      "#{name} - #{description}"
  end

end
