require_relative '../../ui_elements/widgets/scrollable'
require_relative '../../ui_elements/drawables/text'
require_relative '../../tools/file_manager'
class CodeDisplay < Scrollable
    attr :code, :mtime
    LINE_HEIGHT = 20
    DEFAULT_PATH_FILE = File.expand_path("../../../mycodes/sans_titre.rb", File.dirname(__FILE__))
    def build
        self.background_color = Gosu::Color.rgba(0,0,0,255)
        @code_lines_text_keys = []
        @path_file = DEFAULT_PATH_FILE
        puts @path_file
        sync
        super
    end
    def vertical?
        true
    end
    def load path_file
        @path_file = path_file
        @mtime = File.mtime @path_file
        clear_code
        @code = File_manager.read @path_file
        code_lines = @code.split("\n")
        code_lines.each_with_index do |code_line, index|
            element = Text.new(@root, "#{index.to_s.rjust(4)}  #{code_line}\n", center_text: false, color: Gosu::Color::WHITE, font: Gosu::Font.new(20 ,name: "Consolas")){@scrl_rect.relative_to(y: index*LINE_HEIGHT+5)}
            key = index.to_s
            @sub_elements[key] = element
            @code_lines_text_keys << key
        end
        apply_constraints
    end
    def clear_code
        @sub_elements.reject!{|key,val|@code_lines_text_keys.include? key}
        @code_lines_text_keys.clear
    end
    def sync
        Thread.new{
            loop do
                (File.exist? @path_file) ? (load @path_file if @mtime != (File.mtime @path_file)) : clear_code
                sleep 1
            end
        }
    end
end