require_relative '../../ui_elements/ui_element'
require_relative 'top_bar'
require_relative 'contextual_menu'
require_relative 'map_game'
require_relative 'code_display'
class GameUI < UIElement
    #dimensions
    TOP_BAR_HEIGHT = 50
    LEFT_MENU_WIDTH = 250
    RIGHT_MENU_WIDTH = 600
    BOTTOM_BAR_HEIGHT = 150
    MAPS_MENU_HEIGHT = 250
    def build
        #menus
        @sub_elements[:top_bar] = GameTopBar.new(@root){Rectangle2.new(@rectangle.x, @rectangle.y, @rectangle.right-RIGHT_MENU_WIDTH, TOP_BAR_HEIGHT)}
        #game
        @sub_elements[:map_game] = MapGameDisplay.new(@root){Rectangle2.new(@rectangle.x, @rectangle.y + TOP_BAR_HEIGHT, @rectangle.width-RIGHT_MENU_WIDTH, @rectangle.height - TOP_BAR_HEIGHT)}
        
        @sub_elements[:code_display] = CodeDisplay.new(@root){Rectangle2.new(@rectangle.right - RIGHT_MENU_WIDTH, @rectangle.y, RIGHT_MENU_WIDTH, @rectangle.height)}
        #fps
        @sub_elements[:fps_text] = Text.new(@root, "...fps", color: Gosu::Color::WHITE, center_text: false){Rectangle2.new(@rectangle.right - 60, @rectangle.height - 50, 60, 50)}
    end
    def update dt
        super dt
        @sub_elements[:fps_text].string = "#{(1/dt).floor} fps"
    end
end