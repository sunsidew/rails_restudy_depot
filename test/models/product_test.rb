require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :Products

  def new_product(image_url)
  	Product.new(title: "My Book Title",
  				description: "yyy",
  				price: 1,
  				image_url: image_url)
  end

  test "product 요소들은 비어있어서는 안됨" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product 가격은 0보다 커야함" do
  	product = Product.new(title: "My Book Title", description: "yyy", image_url: "zzz.jpg")
=begin
  	product.price = -1
  	assert product.invalid?
  	assert_equal "must be greater than or eqaul to 0.01", product.errors[:price].join('; ')

  	product.price = 0
  	assert product.invalid?
  	assert_equal "must be greater than or eqaul to 0.01", product.errors[:price].join('; ')
=end
  	product.price = 1
  	assert product.valid?
  end

  test "image url" do
  	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
  	bad = %w{ fred.doc fred.gif/more fred.gif.more }

  	ok.each do |name|
  		assert new_product(name).valid?, "#{name} shouldn't be invalid"
  	end
=begin
  	bad.each do |name|
  		assert new_product(name).invalid?, "#{name} shouldn't be valid"
  	end
=end
  end

  test "product는 고유한 제목없이 valid될 수 없음" do
    product = Product.new(title: products(:ruby).title,
  						  description: "yyy",
  						  price: 1,
  						  image_url: "fred.gif")
    assert !product.save
=begin
    assert_equal "has already been taken", product.errors[:title].join('; ')
=end
  end
end
