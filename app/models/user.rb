class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :reviews

  accepts_nested_attributes_for :profile

  acts_as_voter
end
