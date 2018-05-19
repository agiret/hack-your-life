class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :hack

  # Cannot create a new `Vote` without a `user` and a `hack`
  validates :user, presence: true
  validates :hack, presence: true
end
