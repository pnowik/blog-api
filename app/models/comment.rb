class Comment < ApplicationRecord
  belongs_to :post

  # validation
  validates :body, presence: true, length: {minimum: 1, maximum: 300}
end
