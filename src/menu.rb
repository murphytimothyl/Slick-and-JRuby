$:.push File.expand_path('../lib', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

java_import 'org.lwjgl.input.Mouse'
java_import 'org.newdawn.slick.Input'
java_import 'org.newdawn.slick.state.BasicGameState'
java_import 'org.newdawn.slick.Image'

class Menu < BasicGameState

  def initialize(id)
  
    super()
    @id = id

  end
  
  
  def init(container, game)
    
    @play = Image.new('res/playNow.png')
    @exit = Image.new('res/exitGame.png')
    
  end
  
  
  def update(container, game, delta)

    x, y = Mouse.x, Mouse.y
    input = container.get_input
    
    if Mouse.is_button_down(0)
    
      if x > 100 and x < 311 and y > 209 and y < 260
        game.enter_state(C::PLAY)
      elsif x > 100 and x < 311 and y > 109 and y < 160
        java.lang.System.exit(0)
      end
    
    end
      
  end
  
  
  def render(container, game, g)
    
    g.draw_string('Bucky World', 100, 50)
    
    @play.draw(100, 100)
    @exit.draw(100, 200)
    
  end
  
  
  def getID
    return @id
  end
  
end