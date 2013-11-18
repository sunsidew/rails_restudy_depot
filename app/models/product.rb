class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)}i,
		message: '은 GIF, JPG 또는 PNG 이미지를 대상으로 하는 URL입니다.'
	}
end
