require 'java'

require_relative '../lib/lwjgl.jar'
require_relative '../lib/slick.jar'

java_import 'org.lwjgl.input.Mouse'
java_import 'org.newdawn.slick.Input'
java_import 'org.newdawn.slick.Image'
java_import 'org.newdawn.slick.Color'
java_import 'org.newdawn.slick.Animation'
java_import 'org.newdawn.slick.SlickException'
java_import 'org.newdawn.slick.AppGameContainer'
java_import 'org.newdawn.slick.state.StateBasedGame'
java_import 'org.newdawn.slick.state.BasicGameState'

require_relative '../src/c'
require_relative '../src/menu'
require_relative '../src/play'
