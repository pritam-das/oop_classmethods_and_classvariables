class Zombie
    @@horde = []   #collection of all zombies
    @@plague_level = 10
    @@max_speed = 5
    @@max_strength = 8
    @@default_speed = 1       #constant variable, wouldn't change
    @@default_strength = 3     #won't change


#####################Class Methods ###############################
    def self.all
        return @@horde
    end

    def self.new_day
      Zombie.some_die_off
      Zombie.spawn
      Zombie.increase_plague_level
    end

    def self.some_die_off
      (1..rand(10)).each do |zombie|
        @@horde.delete_at(rand(@@horde.size))
      end

    end

    def self.spawn

      (1..rand(@@plague_level)).each do |zombie|
        @new_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
        @@horde << @new_zombie
        @new_zombie
      end

    end

    def self.increase_plague_level
      @@plague_level += rand(2)
      return @@plague_level
    end

    def self.deadliest_zombie
      deadliest_zombie = @@horde[0]
      @@horde.each do |zombie|
        if ((zombie.speed_attribute + zombie.strength_attribute) > (deadliest_zombie.speed_attribute + deadliest_zombie.strength_attribute))
          deadliest_zombie = zombie
        end
      end
      deadliest_zombie
  end

#####################Instance Method ###################################

    attr_reader :speed_attribute, :strength_attribute

    def initialize(speed_attribute, strength_attribute)
      @speed_attribute = speed_attribute
      @strength_attribute = strength_attribute

      if @speed_attribute > @@max_speed
        @speed_attribute = @@default_speed
      end

      if @strength_attribute > @@max_strength
        @strength_attribute = @@default_strength
      end

    end

    def encounter
      if (self.outrun_zombie? == true && self.survive_attack? == true)
        puts "You survived"

      elsif (self.outrun_zombie? == false && self.survive_attack? == true)
        @new_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
        @@horde << @new_zombie
        puts "You're now a zombie!"

      else
        puts "You died"
      end
    end

    def outrun_zombie?
      human_speed = rand(@@max_speed)
      puts human_speed
      if human_speed > @speed_attribute
        return true
      else
        return false
      end
    end

    def survive_attack?
      human_strength = rand(@@max_strength)
      if human_strength > @strength_attribute
        return true
      else
        return false
      end
    end

















end
