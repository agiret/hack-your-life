class Hack < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # Cannot create a new `Hack` without a `link`, `category`and `user`
  validates :link, presence: true
  validates :category, presence: true
  validates :user, presence: true

  # Cannot create two hacks with the same `link`
  validates :link, uniqueness: true

end
