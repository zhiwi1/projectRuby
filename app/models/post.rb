class Post < ApplicationRecord
  has_many :taggings , dependent: :delete_all
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many_attached :files
  belongs_to :user
  validates :hard, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :tags ,presence: true
  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
