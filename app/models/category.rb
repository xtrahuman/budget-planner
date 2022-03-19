class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
end
