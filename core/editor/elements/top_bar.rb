require_relative '../../ui_elements/ui_element'
require_relative '../../ui_elements/widgets/button'
class EditorTopBar < UIElement
    MAPS_DIR = File.join(File.dirname(__FILE__), '../../../MyMaps/')
    def build
        self.background_color = Gosu::Color::GRAY
        @sub_elements[:open_button] = Button.new(@game, "Open")
            .constrain{Rectangle2.new(@rectangle.x + 10, @rectangle.y + 5, 200, 40)}
            .add_event(:mouse_down, options = {button: Gosu::MS_LEFT}){
                @game.busy = true
                @game.window_manager.open_file(MAPS_DIR) do |path_file| 
                    @game.load_map path_file
                    @game.busy = false
                end
            }
                
        @sub_elements[:save_button] = Button.new(@game, "Save")
            .constrain{Rectangle2.new(@rectangle.right - 200 - 10, @rectangle.y + 5, 200, 40)}
            .add_event(:mouse_down, options = {button: Gosu::MS_LEFT}){
                @game.busy = true
                @game.window_manager.save_file(MAPS_DIR) do |path_file|
                    @game.save_map path_file
                    @game.busy = false
                end
            }
        super
    end
end