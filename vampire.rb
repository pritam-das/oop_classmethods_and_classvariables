class Vampire
  @@coven = []

  def self.create(name, age)
     @new_vampire = Vampire.new(name, age)
     @@coven << @new_vampire
     @new_vampire
  end

  def self.sunrise                     ##############wouldn't delete vampires even though condition is succesfully met
    @@coven.delete_if do |vamp|
      if (vamp.in_coffin == false || vamp.drank_blood_today == false)
        puts "#{vamp.name} did not make it"
      end
    end
  end



    #@@coven.each do |vamp|
    #  if (vamp.in_coffin == false || vamp.drank_blood_today == false)
    #   vamp.delete(self)
    #  end
    #end
    #@@coven
  #end

  def self.all
    @@coven
  end

  def self.sunset
    @@coven.each do |vamp|
      vamp.in_coffin = false
      vamp.drank_blood_today = false
    end
  end




#######################Instance Methods################################

attr_reader :name, :age
attr_accessor :in_coffin, :drank_blood_today

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end  



















end
