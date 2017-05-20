class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile
end
