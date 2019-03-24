require 'rails_helper' # in order to get access to the configuration we need to write RSpec tests

describe Product do #tell RSpec which model we want to test
  context "when the product has comments" do
        let(:product) { Product.create!(name: "book") }
        let(:user) {User.create!(email: "test@gmail.com", password: "password")}

        before do
          product.comments.create!(rating: 1, user: user, body: "Awful book!")
          product.comments.create!(rating: 3, user: user, body: "Ok book!")
          product.comments.create!(rating: 5, user: user, body: "Great book!")
        end

        it "returns the average rating of all comments" do
        expect(product.average_rating).to eq 3.0  
        end
  end
end
