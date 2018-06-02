class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :hack

  # Cannot create a new `Vote` without a `user` and a `hack`
  # validates :user, presence: true
  validates :hack, presence: true

  # Only one vote by user for the same hack
  # validates :hack, uniqueness: { scope: :user,
  #   message: "Only on vote per user" }
  # validates_uniqueness_of :booking_date, scope: [:wheely_id]
end
