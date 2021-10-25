class Pet
  attr_reader :name, :age, :breed, :owner_name

  def initialize(name, age, breed, owner_name)
    @name = name
    @age = age
    @breed = breed
    @owner_name = owner_name
  end

  def self.domesticated?
    true
  end

  def greeting
    if name == "Zelda" && breed == "Corgi"
      return "KLDJLK:DSFJWOOFNKLNFOPNRFNKDFSNl;"
    elsif name == "Benny"
      return "grrrrrrrr"
    else
      return "A normal pet greeting"
    end
  end
end