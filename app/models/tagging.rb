class Tagging < ApplicationRecord
=begin
  include PgSearch::Model
  multisearchable against: :name
=end
  belongs_to :tag
  belongs_to :post
end
