module ApplicationHelper

    def base_title title = ''
        sub_title = 'Ruby on Rails Sample App'
        full_title = sub_title
        full_title = " #{title} | #{sub_title}" if !title.empty?
        
        full_title
    end
end
