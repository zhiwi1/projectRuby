class Tag < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :name


  has_many :taggings
  has_many :posts, through: :taggings

end
