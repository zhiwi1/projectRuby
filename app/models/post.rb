class Post < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :content,:hard,:comments,:tags]
  # Добавим вызов метода, осуществляющего переиндексацию, после сохранения записи


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
  def self.text_search(query)
    if query.present?
      where("name ilike :q or content ilike :q",q: "%#{query}%")
    else
      default_scoped
    end
  end
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
  # Сделаем метод реиндексации приватным

  # Опишем метод, который будет вызываться после каждого создания новой записи или обновления существующей

end
