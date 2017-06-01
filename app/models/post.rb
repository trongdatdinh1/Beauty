class Post < ApplicationRecord
  is_impressionable
  acts_as_taggable

  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :order_by_created, (->{order created_at: :desc})
  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true
  validates :post_img, attachment_presence: true
  has_attached_file :post_img, styles: {post_index: "250x350>",
    post_show: "325x475>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/

  acts_as_votable
  searchkick word_middle: [:title, :content]

  def search_data
    {
      title: title,
      content: content,
      tag: tag_list
    }
  end
end
