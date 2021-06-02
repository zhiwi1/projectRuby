class Comment < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :comment

  belongs_to :post

end
