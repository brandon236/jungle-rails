require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully' do
      @category = Category.new
      @product = Product.new;
      @product.price_cents = 304032
      @product.name = "new product"
      @product.quantity = 15
      @product.category = @category
      @product.save!
      expect(@product).to be_present
    end
    it 'should have a name' do
      @category = Category.new
      @product = Product.new;
      @product.price_cents = 304032
      @product.name = "new product"
      @product.quantity = 15
      @product.category = @category
      @product.save!
      expect(@product.name).to be_present
    end
    it 'should have a price' do
      @category = Category.new
      @product = Product.new;
      @product.price_cents = 304032
      @product.name = "new product"
      @product.quantity = 15
      @product.category = @category
      @product.save!
      expect(@product.price).to be_present
    end
    it 'should have a quantity' do
      @category = Category.new
      @product = Product.new;
      @product.price_cents = 304032
      @product.name = "new product"
      @product.quantity = 15
      @product.category = @category
      @product.save!
      expect(@product.quantity).to be_present
    end
    it 'should have a category' do
      @category = Category.new
      @product = Product.new;
      @product.price_cents = 304032
      @product.name = "new product"
      @product.quantity = 15
      @product.category = @category
      @product.save!
      expect(@product.category).to be_present
    end
  end
end
