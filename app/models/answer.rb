class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :reply, presence: true
  validates :rates, presence: true

end
