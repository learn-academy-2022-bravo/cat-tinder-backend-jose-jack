require 'rails_helper'

RSpec.describe Reptile, type: :model do
  describe "Create reptile validations" do    
    it "must contain a name" do
      reptile = Reptile.create age: 23, enjoys:'Laying on a rock', image:'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
      expect(reptile.errors[:name]).to_not be_empty 
    end 
    it "must contain an age" do
      reptile = Reptile.create name: 'Fred', enjoys:'Laying on a rock', image:'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
      expect(reptile.errors[:age]).to_not be_empty 
    end 
    it "must contain an enjoys" do
      reptile = Reptile.create name: 'Fred', age: 23, image:'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
      expect(reptile.errors[:enjoys]).to_not be_empty 
    end 
    it "must contain 10 or more characters" do
      reptile = Reptile.create name: 'Fred', age: 23, enjoys: "Sun", image:'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
      expect(reptile.errors[:enjoys]).to_not be_empty 
    end 
    it "must contain an image" do
      reptile = Reptile.create name:'Fred', age: 23, enjoys:'Laying on a rock'
      expect(reptile.errors[:image]).to_not be_empty 
    end 
  end
end
