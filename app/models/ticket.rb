class Ticket < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true, length: {minimum: 5, maximum: 50 }
  validates :description, presence: true, length: {minimum: 5, maximum: 500 }
  validates :issue_type, presence: true
  
  # ensure userid is present..
  validates :user_id, presence: true
end