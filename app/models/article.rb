class Article < ActiveRecord::Base
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 8}
    validates :user_id, presence: true
end