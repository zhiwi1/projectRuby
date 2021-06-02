class Answer < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:reply]
  belongs_to :user
  belongs_to :post
  validates :reply, presence: true
  validates :rates, presence: true
  private

end
