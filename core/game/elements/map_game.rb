require_relative '../../ui_elements/widgets/game_container'
class MapGameDisplay < GridGameContainer
    def build
        self.background_color = Gosu::Color::rgba(0,200,0, 255)
    end
end