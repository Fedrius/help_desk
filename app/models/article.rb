# class Article <ApplicationRecord (rails 5)
class Article < ActiveRecord::Base
  # many articles belong to one user
  belongs_to :user
  
  # many..
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  # validates to make sure theres an input in record and certain length
  validates :title, presence: true, length: {minimum: 5, maximum: 50 }
  validates :description, presence: true, length: {minimum: 5, maximum: 500 }
  
  # ensure userid is present..
  validates :user_id, presence: true
end