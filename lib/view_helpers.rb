module WillToggle
  module ViewHelpers
    @@toggle_index ||= 0
    
    def will_toggle(options = {})
      attribute = nil
      @@toggle_index += 1
      generate_html(attribute, options).html_safe
    end
  
    def generate_html(attribute, options = {})
      <<-HTML
        <div class='will-toggle-wrapper'>
          <div class='field check-box'>
            #{ get_check_box(attribute, options) }
          </div>
          <div class='will-toggle-content' id="will-toggle-#{ @@toggle_index }">
            #{ get_partial(options) }
          </div>
        </div>
      HTML
    end
  
    def get_check_box(attribute, options = {})
      html = ''
      if attribute
        html << options[:form].check_box(attribute, onChange: js_call, class: 'check-box')
        html << options[:form].label(attribute, options[:label])
      else
        html << check_box_tag(nil, nil, options[:checked], onChange: js_call, class: 'check-box')
        html << label_tag(nil, options[:label])
      end
      html
    end
    
    def get_partial(options = {})
      render partial: options[:partial], 
             locals: options[:locals]
    end
    
    def js_call
      "willToggle.toggleNext('#will-toggle-#{ @@toggle_index }');"
    end
  end
end