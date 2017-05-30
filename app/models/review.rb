class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewed, class_name: "User", foreign_key: "reviewed_id"

  validates :user, presence: true, uniqueness: {scope: :reviewed_id}
  validates :star, presence: true
end
