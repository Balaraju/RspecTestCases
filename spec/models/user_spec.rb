require 'rails_helper'

RSpec.describe User, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  
  it "is invalid without a firstname" do
    expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
  end
  
  it "is invalid without a lastname" do
    expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
  end
  
  it "returns a contact's full name as a string" do
    contact = FactoryGirl.build(:user, first_name: "John", last_name: "Doe") 
    expect(contact.name) == "John Doe" 
    #See more at: http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html#sthash.ZwBd9eQz.dpuf
  end
  
  describe "filter last name by letter" do 
    before :each do 
      @simth =  FactoryGirl.create(:user, last_name: "Smith")
      @jones =  FactoryGirl.create(:user, last_name: "jones")
      @jansi =  FactoryGirl.create(:user, last_name: "jansi")
    end
  
    context "matching letters" do 
      it "returns all user names who have last name with letter J" do 
        expect(User.by_letter("j")).to  eq([@jansi, @jones])
      end
    end
    
    context "non-matching letters" do
      it "returns all user names who have not with that letter J" do
        expect(User.by_letter("j")).not_to eql(include @smith)
      end
    end
  end
   
   
  
  # See more at: http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html#sthash.ZwBd9eQz.dpuf
end
