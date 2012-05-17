module ApplicationHelper
   
   # link to logo
   def logo
     base_logo = image_tag("logo.png", :alt => "USDA_ESMIS", :class => "round")
     if @logo.nil?
       base_logo
     else
       "#{@logo}"
     end
   end
   
   # Return a title on a per-page basis.
   def title
     base_title = "USDA_ESMIS"
     if @title.nil?
       base_title
     else
       "#{base_title} | #{@title}"
     end
   end
end
