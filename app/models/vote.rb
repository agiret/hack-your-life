class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :hack
end
