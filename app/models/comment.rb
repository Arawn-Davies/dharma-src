class Comment < ApplicationRecord
  belongs_to :literature
  belongs_to :user

  validates :body, presence: true, length: { maximum: 2_000 }
end
