java_import 'org.newdawn.slick.Color'
java_import 'org.newdawn.slick.Animation'
java_import 'org.newdawn.slick.state.BasicGameState'

class Play < BasicGameState

  def initialize(id)
    
    super()
    @id = id
    
  end
  
  
  def init(container, game)
    
    @bucky_vel = 0.3
    @bucky_x, @bucky_y = 100, 100
    
    @white = Color.new(1.0, 1.0, 1.0)
    @gray = Color.new(0.1, 0.1, 0.1)

    @world_map = Image.new('res/world.png')
    
    @duration = Array.new(2, 200).to_java(Java::int)
    @walk_up = Array.new(2) { Image.new('res/buckysBack.png') }
    @walk_down = Array.new(2) { Image.new('res/buckysFront.png') }
    @walk_left = Array.new(2) { Image.new('res/buckysLeft.png') }
    @walk_right = Array.new(2) { Image.new('res/buckysRight.png') }
      
    @moving_up = Animation.new(@walk_up.to_java(Image), @duration)
    @moving_down = Animation.new(@walk_down.to_java(Image), @duration)
    @moving_left = Animation.new(@walk_left.to_java(Image), @duration)
    @moving_right = Animation.new(@walk_right.to_java(Image), @duration)
    @bucky = @moving_down
     
    @quit = false
    
  end
  
  
  def update(container, game, delta)
    
    ds = @bucky_vel * delta
    input = container.get_input
    
    if input.is_key_pressed(Input::KEY_ESCAPE)
      @quit = !@quit
    
    elsif input.is_key_down(Input::KEY_W)
      
      @bucky = @moving_up
      @bucky_y = [202, @bucky_y + ds].min
        
    elsif input.is_key_down(Input::KEY_A)
      
      @bucky = @moving_left
      @bucky_x = [-320, @bucky_x - ds].max
      
    elsif input.is_key_down(Input::KEY_S)
      
      @bucky = @moving_down
      @bucky_y = [-578, @bucky_y - ds].max
      
    elsif input.is_key_down(Input::KEY_D)

      @bucky = @moving_right
      @bucky_x = [840, @bucky_x + ds].min
        
    end

    if @quit
      
      if input.is_key_down(Input::KEY_R)
        @quit = false
      elsif input.is_key_down(Input::KEY_M)
        @quit = false
        game.enter_state(C::MENU)
      elsif input.is_key_down(Input::KEY_Q)
        java.lang.System.exit(0)
      end
        
    end
          
  end
  
  
  def render(container, game, g)
    
    @world_map.draw(-@bucky_x, @bucky_y)
    @bucky.draw(C::WIDTH / 2, C::HEIGHT / 2)
    
    str = "Bucky's Position: (%.1f, %.1f)" % [@bucky_x, @bucky_y]
    g.draw_string(str, 330, 10)
    
    if @quit
      
      g.set_color(@gray)
      g.fill_rect(240, 98, 136, 126)
      
      g.set_color(@white)
      g.draw_string('Resume (r)', 250, 100)
      g.draw_string('Main Menu (m)', 250, 150)
      g.draw_string('Quit (q)', 250, 200)
      
    end
    
  end
  
  
  def getID
    @id
  end
  
end
