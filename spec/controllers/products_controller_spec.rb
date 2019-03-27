require 'rails_helper'

describe ProductsController, type: :controller do

  let(:user) {User.create!(email: "test@gmail.com", password: "password")}
  let(:product) { Product.create!(name: "book", description:"I am a description", price:100) }

  describe 'GET #index' do
    it 'renders products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'renders products page' do
      get :show, params: {id: product}
      expect(response).to be_ok
    end
  end

  describe 'GET #new' do
    before do
      sign_in user
    end
    it 'redirects to new product page' do
      get :new, params: {id: product}
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET #edit' do
    before do
      sign_in user
    end
    it 'redirects to edit product page' do
      get :edit, params: {id: product}
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST #create' do
    before do
      sign_in user
    end
    it 'creates a new product' do
      expect(Product.new(name: "book", description: "Nice book", price: 100))
      expect(response).to be_successful
    end
    #it 'cannot create new product' do
    #  expect(Product.new).not_to be_valid
    #end
  end



  describe 'DElETE #destroy' do
    before do
      sign_in user
    end
    it 'deletes product' do
      expect(Product.new(name: "book", description: "Nice book", price: 100))
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to (root_path)
    end
  end


  end
