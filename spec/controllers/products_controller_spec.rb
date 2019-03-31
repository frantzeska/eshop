require 'rails_helper'

describe ProductsController, type: :controller do

  #let(:user) {User.create!(email: "test@gmail.com", password: "password")}
  #let(:product) { Product.create!(name: "book", description:"I am a description", price:100) }
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'renders products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'renders products page' do
      get :show, params: {id: @product}
      expect(response).to be_ok
    end
  end

  describe 'GET #new' do
    it 'redirects to new product page' do
      get :new, params: {id: @product}
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET #edit' do
    it'redirects to edit product page' do
      get :edit, params: {id: @product}
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST #create' do
    it 'creates a new product' do
      #expect(Product.new(name: "book", description: "Nice book", price: 100))
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
    #it 'cannot create new product' do
    #  expect(Product.new).not_to be_valid
    #end
  end



  describe 'DELETE #destroy' do
    it 'deletes product' do
      #expect(Product.new(name: "book", description: "Nice book", price: 100))
      @product = FactoryBot.create(:product)
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to (root_path)
    end
  end


  end
