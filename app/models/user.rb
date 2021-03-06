class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def name
    [first_name, last_name].join " "
  end
  
  def self.by_letter(letter) 
    where("last_name LIKE ?", "#{letter}%").order(:last_name) 
  end #See more at: http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html#sthash.ZwBd9eQz.dpuf
  
end
