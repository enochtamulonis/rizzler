class PickupLine < ApplicationRecord
  belongs_to :user, optional: true
end
