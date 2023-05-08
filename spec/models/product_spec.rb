require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a product if all of the validations are true' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Big Plant", price_cents: 49000, quantity: 35, :category => @category) 
      @product.valid?
      expect(@product.save).to be true
    end

    it "validates name presence" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: nil, price_cents: 49000, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates price presence" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Big Plant", price_cents: nil, quantity: 35, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "validates quantity presence" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Big Plant", price_cents: 49000, quantity: nil, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates category presence" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Big Plant", price_cents: 49000, quantity: 35, :category => nil)
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end


