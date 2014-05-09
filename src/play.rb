$:.push File.expand_path('../lib', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

java_import 'org.newdawn.slick.Animation'
java_import 'org.newdawn.slick.state.BasicGameState'

class Play < BasicGameState

  def initialize(id)
    super()
    @id = id
    
  end
  
  def init(container, game)
    
    @bucky_x, @bucky_y = 0, 0
    @shift_x, @shift_y = C::WIDTH/2, C::HEIGHT/2

    @world_map = Image.new('res/world.png')
    
    @walk_up = Array.new(2) { Image.new('res/buckysBack.png') }
    @walk_down = Array.new(2) { Image.new('res/buckysFront.png') }
    @walk_left = Array.new(2) { Image.new('res/buckysLeft.png') }
    @walk_right = Array.new(2) { Image.new('res/buckysRight.png') }

    @duration = [200, 200].to_java(Java::int)
      
    @moving_up = Animation.new(@walk_up.to_java(Image), @duration)
    @moving_down = Animation.new(@walk_down.to_java(Image), @duration)
    @moving_left = Animation.new(@walk_left.to_java(Image), @duration)
    @moving_right = Animation.new(@walk_right.to_java(Image), @duration)
    @bucky = @moving_down
     
    @quit = false
    
  end
  
  
  def update(container, game, delta)
    
    input = container.get_input
    
    vel = 0.3 * delta
    
    if input.is_key_down(Input::KEY_W)
      
      @bucky = @moving_up
      @bucky_y = [202, @bucky_y + vel].min
        
    elsif input.is_key_down(Input::KEY_A)
      
      @bucky = @moving_left
      @bucky_x = [@bucky_x - vel, -328].max
      
    elsif input.is_key_down(Input::KEY_S)
      
      @bucky = @moving_down
      @bucky_y = [@bucky_y - vel, -578].max
      
    elsif input.is_key_down(Input::KEY_D)

      @bucky = @moving_right
      @bucky_x = [846, @bucky_x + vel].min
        
    elsif input.is_key_down(Input::KEY_ESCAPE)
    
      @quit = true
      
    end

    if @quit
      
      if input.is_key_down(Input::KEY_R)
        @quit = false
      elsif input.is_key_down(Input::KEY_M)
        game.enter_state(C::MENU)
      elsif input.is_key_down(Input::KEY_Q)
        java.lang.System.exit(0)
      end
        
    end
          
  end
  
  
  def render(container, game, g)
    
    @world_map.draw(-@bucky_x, @bucky_y)
    @bucky.draw(@shift_x, @shift_y)
    
    str = "Bucky's Position: (%.1f, %.1f)" % [@bucky_x, @bucky_y]
    g.draw_string(str, 300, 10)
    
    if @quit
      
      g.draw_string('Resume (r)', 250, 100)
      g.draw_string('Main Menu (m)', 250, 150)
      g.draw_string('Quit (q)', 250, 200)
      g.fill_rect(240, 98, 100, 200)
    
      g.clear if !@quit
      
    end
    
  end
  
  
  def getID
    return @id
  end
  
end