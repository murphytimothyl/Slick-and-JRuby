require 'src/initializer'

class Game < StateBasedGame
  
  def initialize(name)
    
    super
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
