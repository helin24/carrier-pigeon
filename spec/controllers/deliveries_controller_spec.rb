require 'rails_helper'
require 'spec_helper'

describe DeliveriesController do

  before(:each) do
    Delivery.create!(from_city: "Here" ,to_city: "There", departure_date: "2014-12-12")
    Delivery.create!(from_city: "Aqui" ,to_city: "Alla")

  end

  describe '#index' do
    it 'must redirect unlogged users to login page' do
      get :index
      expect(response).to redirect_to(login_url)
    end

    it 'must not redirect logged users to login page' do
      session[:user_id] = 1
      get :index
      expect(response.status).to eq 200
    end

    it 'has a variable that contains multiple objects' do
      session[:user_id] = 1
      get :index
      expect(assigns(:deliveries).length).to be(1)
    end

  end

  describe '#new' do
    it 'should redirect to login if there is no active session' do
      get :new
      expect(response).to redirect_to(login_url)
    end

    it 'should render the new delivery template if the user is logged in' do
      session[:user_id] = 1
      get :new
      expect(response).to render_template('new')
    end
  end

  describe '#create' do
    before do
      session[:user_id] = 1
    end

    xit 'should create a new delivery object and assign it to the user' do
      post :create, delivery: {package_size: 'large'}
      #, delivery: {package_size: 'Large', from_city: 'San Diego', to_city: 'Vancouver', price: 10, departure_date: Date.new(2014, 9, 23), arrival_date: Date.new(2014, 9, 27)}
      Delivery.any_instance.stub(:save).with(true)
      # delivery.stub(:save).with(true)
      expect(response).to redirect_to(delivery_path(Delivery.last.id))
    end

    xit 'should render new page again if delivery does not save properly' do
      post :create, delivery: {package_size: 'large'}
      Delivery.any_instance.stub(:save).with(false)
      expect(response).to render_template('new')
    end
  end

  describe '#edit' do
    xit 'should redirect to login if there is no active session' do
      get :edit
      expect(response).to redirect_to(login_url)
    end

    xit 'should render delivery edit template if there is an active session' do
      session[:user_id] = 1
      get :edit
      expect(response).to render_template('edit')
    end
  end
end
