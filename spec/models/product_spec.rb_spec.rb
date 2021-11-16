require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should save a product with valid name, price, quantity, category' do
      @category = Category.create(name:"Transportation")
      product = Product.new(
        name: "Tesla",
        price_cents: 100000.00,
        quantity: 3,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end

    it 'should not save a product without valid name' do
      @category = Category.create(name:"Transportation")
      name = Product.new(
        name: nil,
        price_cents: 100000.00,
        quantity: 3,
        category_id: @category.id
        )
      expect(name).to_not (be_valid)
    end

    it 'should not save a product without valid quantity' do
      @category = Category.create(name:"Transportation")
      quantity = Product.new(
        name: "Tesla",
        price_cents: 100000.00,
        quantity: nil,
        category_id: @category.id
        )
      expect(quantity).to_not (be_valid)
    end

    it 'should not save a product without valid category' do
      @category = Category.create(name:"Transportation")
      category_id = Product.new(
        name: "Tesla",
        price_cents: 100000.00,
        quantity: 3,
        category_id: nil
        )
      expect(category_id).to_not (be_valid)
    end

    it 'should not save a product without valid price_cents' do
      @category = Category.create(name:"Transportation")
      price_cents = Product.new(
        name: "Tesla",
        price_cents: nil,
        quantity: 3,
        category_id: @category.id
        )
      expect(price_cents).to_not (be_valid)
    end

    


  end
end
