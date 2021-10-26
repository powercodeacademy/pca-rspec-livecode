require "spec_helper"
require_relative "../pet"

describe Pet do
  describe ".domesticated?" do
    it "returns true for the class of Pet" do
      expect(Pet.domesticated?).to eq true
      # left hand side is the code you're executing
      # right hand side is the value you're expecting
    end
  end

  describe ".new" do
    it "initializes with a name, age, breed, owner name" do
      # Let's create a pet with a name age breed and owner name
      # Make sure we don't get any errors
      expect{ create_new_pet }.to_not raise_error
    end

    it "is created with accessible name, age, breed and owner name" do
      pet = create_new_pet

      expect(pet.name).to eq "Zelda"
      expect(pet.age).to eq 1
      expect(pet.breed).to eq "Corgi"
      expect(pet.owner_name).to eq "Sebastian"
    end
  end

  describe "#greeting" do
    describe "For a corgi named zelda" do
      it "responds accordingly for how Zelda would respond" do
        zelda = create_new_pet
        expect(zelda.greeting).to eq "KLDJLK:DSFJWOOFNKLNFOPNRFNKDFSNl;"
      end

      it "responds with grrr for pets named benny" do
        benny = create_new_pet(pet_name: "Benny")
        expect(benny.greeting).to eq "grrrrrrrr"
      end

      it "responds with a normal greeting for all other dogs" do
        other_dog = create_new_pet(pet_name: "Other Dog")
        expect(other_dog.greeting).to eq "A normal pet greeting"
      end
    end
  end

  def create_new_pet(pet_name: "Zelda")
    Pet.new(pet_name, 1, "Corgi", "Sebastian")
  end
end

# FactoryBot is a useful gem that allows us to create fake data
# Coveralls is a useful gem/tool that looks at the coverage of our code