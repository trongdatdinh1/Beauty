class Profile < ApplicationRecord
  belongs_to :user, optional: true

  has_attached_file :avatar, styles: {user_show: "300x450>"},
    default_url: "/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
