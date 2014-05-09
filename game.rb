$:.push File.expand_path('../lib', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

require 'src/c'
require 'src/menu'
require 'src/play'

java_import 'org.newdawn.slick.AppGameContainer'
java_import 'org.newdawn.slick.SlickException'
java_import 'org.newdawn.slick.state.StateBasedGame'

class Game < StateBasedGame
  
  def initialize(name)
    
    super(name)
    add_state(Menu.new(C::MENU))
    add_state(Play.new(C::PLAY))
    
  end
  
  
  def initStatesList(container)
    
    get_state(C::MENU).init(container, self)
    get_state(C::PLAY).init(container, self)
    enter_state(C::MENU)
    
  end

end


begin

  app = AppGameContainer.new(Game.new(C::NAME))
  app.set_display_mode(C::WIDTH, C::HEIGHT, false)
  app.start

rescue SlickException => e

  puts e.print_stack_trace

end
