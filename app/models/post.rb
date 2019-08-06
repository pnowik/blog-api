class Post < ApplicationRecord
  # model association]
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :subtitle, presence: true, length: {minimum: 30, maximum: 300}
  validates :body, presence: true, length: {minimum: 100, maximum: 5000}
  validates :created_by, presence: true
end
