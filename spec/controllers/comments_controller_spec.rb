require 'rails_helper'

describe CommentsController, type: :controller do

  let(:user){ Comment.create(:user) }
  let(:product){ Product.create!(name: "book")}

    context 'when a user is logged in' do
     before do
       sign_in sign
     end

     it 'can create comment' do
       post :create, params: { product_id: product.id, comment: { body: "this is a very good book.", rating:5 } }
       expect(response).to have_http_status(302)
     end
   end
  end
