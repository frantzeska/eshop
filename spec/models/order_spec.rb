require 'rails_helper'

describe Order do

    let(:product) { Product.create!(name:"book", price:100)}
    let(:user) {User.create!(email: "test@gmail.com", password: "password")}

    it "is a valid order" do
      expect(Order.new( user: user, product: product, total: 100, price:100)).to be_valid
    end

    it "is not valid without a user" do
      expect(Order.new( user: "", product: product, total: 100, price:100)).not_to be_valid
    end

    it "is not valid without product" do
      expect(Order.new( user: user, product: "", total: 100, price:100)).not_to be_valid
    end

    it "is not valid without price" do
      expect(Order.new( user: user, product: product, total: 100, price:"")).not_to be_valid
    end
end
