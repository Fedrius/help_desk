# class Article <ApplicationRecord (rails 5)
class Article < ActiveRecord::Base
  # validates to make sure theres an input in record and certain length
  validates :title, presence: true, length: {minimum: 3, maximum: 50 }
  validates :description, presence: true, length: {minimum: 5, maximum: 300 }
end