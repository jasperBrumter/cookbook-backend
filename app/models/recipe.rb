class Recipe < ApplicationRecord
	has_many :ingredients, dependent: :destroy
	has_many :steps, dependent: :destroy
	belongs_to :user

	validates :name, presence: true
	validates :image, presence: true
end
