class Menu < BasicGameState

  def initialize(id)
  
    super()
    @id = id

  end
  
  
  def init(container, game)
    
    @play = Image.new('res/playNow.png')
    @play_x, @play_y = 220, 109
    @exit = Image.new('res/exitGame.png')
    @exit_x, @exit_y = 220, 209
    
  end
  
  
  def update(container, game, delta)

    input = container.get_input
    x, y = Mouse.x, C::HEIGHT - Mouse.y
    
    if Mouse.is_button_down(0)
    
      if x.between?(@play_x, @play_x + @play.width)
        
        if y.between?(@play_y, @play_y + @play.height)
          game.enter_state(C::PLAY)
        elsif y.between?(@exit_y, @exit_y + @exit.height)
          java.lang.System.exit(0)
        end
        
      end
    
    end
      
  end
  
  
  def render(container, game, g)
    
    g.draw_string("Bucky's Ruby Land", 240, 50)
    
    @play.draw(@play_x, @play_y)
    @exit.draw(@exit_x, @exit_y)
    
  end
  
  
  def getID
    @id
  end
  
end
