require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #index" do 
    it "populates an array of contacts" do
      contact = FactoryGirl.create(:user) 
      contact1 = FactoryGirl.create(:user) 
      contact2 = FactoryGirl.create(:user) 
      get :index 
      expect(assigns(:users)).to eq([contact, contact1, contact2]) 
    end
    
    it "renders the :index view"  do
      get :index 
      expect(response).to render_template(:index) 
    end
  end 
  
  describe "GET #new" do
    it "render a new page" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end
  
  
  describe "POST #create" do 
    context "with valid attributes" do
      it "Creates new contact" do
        expect{ post :create, user: {:first_name => "Bala", :last_name => "Raju"} }.to change(User,:count).by(1) 
      end
      it "redirects to the new contact" do 
        post :create, 
        user: FactoryGirl.attributes_for(:user) 
        expect(response).to redirect_to :action => :show,
                                     :id => assigns(:user).id
      end 
    end
    
    context "with invalid attributes" do
      it "creates a new contact with out invalid contact details" do 
        expect{
          post :create, user: FactoryGirl.attributes_for(:invalid_user) }.to_not change(User, :count)
        
     end
     
     it "Render to a new page " do 
      post :create, 
      user: FactoryGirl.attributes_for(:invalid_user)
      expect(response).to render_template(:new)
     end
    end
  end
  
  describe "GET #show" do
    it "Showing a particular user" do 
     
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(assigns(:user)).to eq(user) 
    end
   
   it "showing template of show page" do
    user = FactoryGirl.create(:user)
    get :show, id: user
    expect(response).to render_template :show
   end
  end
  
  describe "DELETE #destroy" do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    
   it "After deleting user count change to -1 " do
    expect{
      delete :destroy, id: @user
    }.to change(User, :count).by(-1)
   end
   
   it "After delete page redirect_to index" do 
    delete :destroy, id: @user
    expect(response).to redirect_to(users_path)
   end
  end
  
  describe "GET #edit" do
    it "showing edit template" do 
      user = FactoryGirl.create(:user)
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end
  
  describe "PUT #update" do
    it "update user details"
    it "update user valid details"
  end
  
end
