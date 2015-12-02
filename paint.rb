require 'green_shoes'
#setting the window size 
Shoes.app title: "Paint Project",:width => 400, :height => 400 do
  #(void setup)
	@red = rect 0, 360, 40, 40, :fill => "#E30B0B"
	@orange = rect 40, 360, 40, 40, :fill => "#E36C0B"
	@yellow = rect 80, 360, 40,40, :fill => "#DEF200"
	@green = rect  120, 360, 40, 40, :fill => "#1CF200"
	@blue = rect  160, 360, 40, 40, :fill => "#00F2E6"			
	@navy_blue = rect 200, 360, 40, 40, :fill => "#2400F2"
  @purple = rect 240, 360, 40, 40, :fill => "#8500F2"
 	@rubber = rect 320, 360, 40, 40, :fill => "#000000"
    
	previous_pos_x = nil
	previous_pos_y = nil
	stroke "#000000"
	
	clear_screen = button "new slate"
  clear_screen.click {background "#000000"}
  
	#paint method (void loop)
	animate 100 do
		button, x,y = self.mouse
		
		if button == 1
			line(previous_pos_x, previous_pos_y, x,y)
		end
		
		previous_pos_x = x
		previous_pos_y = y
		
		click do |button, x, y|
			if button == 1
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
			end
		end
	end
		
end
