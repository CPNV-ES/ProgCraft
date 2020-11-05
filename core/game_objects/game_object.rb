require_relative '../tools/vector'
class GameObject
    attr :id, :name, :texture, :img_path 
    attr_accessor :position
    def initialize id=nil, name=nil , img_path='basic_texture.png', position=Vector2.new(0,0)
        file_path = File.expand_path(File.join("..", "assets", img_path), File.dirname(__FILE__))
        @id, @name, @texture, @position, @img_path = id, name, Gosu::Image.new(file_path), position, img_path
    end 
    def draw x=@position.x, y=@position.y
        Gosu.draw_rect(x,y,50,50,Gosu::Color::RED)
        @texture.draw(x, y, 0)
    end
    def hash
        {"id": @id, "type": self.class.to_s, "name": @name, "position": {"x": @position.x, "y": @position.y}, "data": {"texture": @img_path}}
    end
end