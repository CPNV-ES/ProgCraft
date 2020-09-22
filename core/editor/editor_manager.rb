require 'pp'
require_relative 'elements/editor_ui'
require_relative '../events/event_handler'
class EditorManager
    attr_reader :window
    def initialize window
        @events=[]
        @window = window
        @editor_ui = EditorUI.new self, Rectangle2.new(0,0)
    end
    def update dt
        @editor_ui.update dt
    end
    def render
        # final draw
        elements_to_draw = @editor_ui.render.flatten
        elements_to_draw.each{|drawable| drawable.draw}
    end
    def apply_constraints
        @editor_ui.rectangle.width = window.width
        @editor_ui.rectangle.height = window.height
        @editor_ui.apply_constraints
    end
    def event data, type
        @events.each{|event| event.trigger(data) if event.type == type }
    end
    
    def add_event event
        @events.push(event)
    end
end