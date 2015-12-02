require 'green_shoes'

class Paint
  #setting the window size 
  #void setup
  Shoes.app title: "Paint Project",:width => 320, :height => 400 do
    
    box = 
    background "#B7C5C9"
    red = rect 0, 360, 40, 40, :fill => "#E30B0B"
    orange = rect 40, 360, 40, 40, :fill => "#E36C0B"
    yellow = rect 80, 360, 40,40, :fill => "#DEF200"
    green = rect  120, 360, 40, 40, :fill => "#1CF200"
    blue = rect  160, 360, 40, 40, :fill => "#00F2E6"			
    navy_blue = rect 200, 360, 40, 40, :fill => "#2400F2"
    purple = rect 240, 360, 40, 40, :fill => "#8500F2"
    rubber = rect 280, 360, 40, 40, :fill => "#B7C5C9"
 
    previous_pos_x = nil
    previous_pos_y = nil
    
    stroke "#E30B0B"
    brush_size = 5
    
    increase_size = button "Brush Size +"
    decrease_size = button "Brush Size -"
    clean_slate = button "Wipe Page"
    message = para "Brush size is:" + brush_size.to_s
    
    increase_size.click do
      brush_size = brush_size + 5
      message.replace "Brush size is:" + brush_size.to_s
    end
    
    decrease_size.click do
      brush_size = brush_size - 5
      message.replace "Brush size is:" + brush_size.to_s
    end
    
    
   
  #end
          
    #paint method (void loop)
    animate do
    
      strokewidth(brush_size)
      brush_size = 10 if brush_size <= 0
 
      button, x,y = self.mouse
          
      #if button is pressed draw line
      if button == 1
        line(previous_pos_x, previous_pos_y, x,y)
      end
          
      previous_pos_x = x
      previous_pos_y = y
          
      click do |button, x, y|
        if button == 1
          #color
          if (y > 360 && y < 400) && (x > 0 && x < 40)
            stroke "#E30B0B"
          end
              
          if (y > 360 && y < 400) && (x > 40 && x < 80)
            stroke "#E36C0B"
          end
              
          if (y > 360 && y < 400) && (x > 80 && x < 120)
            stroke "#DEF200"
          end
              
          if (y > 360 && y < 400) && (x > 120 && x < 160)
            stroke "#1CF200"
          end
              
          if (y > 360 && y < 400) && (x > 160 && x < 200)
            stroke "#00F2E6"
          end
              
          if (y > 360 && y < 400) && (x > 200 && x < 240)
            stroke "#2400F2"
          end
              
          if (y > 360 && y < 400) && (x > 240 && x < 280)
            stroke "#8500F2"
          end	
            
          #eraser
          if (y > 360 && y < 400) && (x > 280 && x < 320)
            stroke "#B7C5C9"
          end	
              
        end
      end  
    end 
  end      
      
end
