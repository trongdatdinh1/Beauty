class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews
  has_many :notifications, dependent: :destroy
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  accepts_nested_attributes_for :profile

  acts_as_voter
end
