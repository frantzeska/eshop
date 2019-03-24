require 'rails_helper'

describe Comment do
    context "when the product has comments" do
        let(:user){ Comment.create(:user) }
        let(:product){ Product.create!(name: "book")}

        before do
            product.comments.create!(body: "this is a very good book.")

        it "not valid without a body" do
          expect(comment.body).not_to be_valid
        end

        it "to be valid" do
          expect(product.comments.new(body: "this is a very good book.", rating:5)).to be_valid
        end
    end
end
