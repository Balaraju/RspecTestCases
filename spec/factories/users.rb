FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
  end
  
  factory :invalid_user, parent: :user do |f| 
    f.first_name nil 
  end 
  
end
