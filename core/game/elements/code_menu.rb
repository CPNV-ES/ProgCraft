require_relative '../../ui_elements/ui_element'
require_relative '../../ui_elements/drawables/text'
require_relative '../../ui_elements/widgets/button'
class CodeMenu < UIElement
    attr_accessor :path_file
    BUTTON_WIDTH = 100
    def build
        self.background_color = Gosu::Color.rgba(200,200,200,255)
        @path_file = "../../../mycodes/sans_titre.rb"
        @sub_elements[:filename] = Text.new(@root, "programe_sans_titre.rb", center_text: false, color: Gosu::Color::BLACK, font: Gosu::Font.new(20 ,name: "Consolas")){@rectangle.relative_to(x: 5 ,y: @rectangle.y + @rectangle.height/2 - 10)}
        @sub_elements[:load_program_button] = Button.new(@root, "Edit")
        .constrain{Rectangle2.new(@rectangle.right - BUTTON_WIDTH - 5, @rectangle.y + 5, BUTTON_WIDTH, @rectangle.height - 10)}
        .add_event(:mouse_down, options = {button: Gosu::MS_LEFT}){
            @root.edit_program
        }
        super
    end
    def edit
        # TODO not working
        res = system("code #{File.expand_path(@path_file, File.dirname(__FILE__))}")
        res = system("C:\Program Files (x86)\Notepad++ #{File.expand_path(@path_file, File.dirname(__FILE__))}") if res.nil?
        res = system("notepad #{File.expand_path(@path_file, File.dirname(__FILE__))}") if res.nil?
    end
    def path_file=path_file
        @sub_elements[:filename].string = path_file.split('/').last
        @path_file = path_file
    end
end