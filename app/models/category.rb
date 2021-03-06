class Category < ApplicationRecord
  has_many :hacks
  has_many :votes, through: :hacks
  has_many :users, through: :hacks


  # Cannot create a new `Category` without a `name`
  validates :name, presence: true

  # Cannot create two categories with the same `name`
  validates :name, uniqueness: true

  # `name` has to be one of the options
  # validates :name, inclusion: { in: ["sports", "clothing", "technology"] }

end
