require 'green_shoes'
require './paint'
#store another brush
 

class Protanopia < Paint
			
		def paint_prota
			animate do
				#size is 8, resets to 8 if goes to low or to high
				strokewidth(@brush_size)
				@brush_size = 8 if @brush_size <= 0
				@brush_size = 8 if @brush_size >= 32
				button, x,y = self.mouse
				#if button is pressed between the frame, it will draw the line. 
				if button == 1
					if (@previous_pos_x > 2 && @previous_pos_x < 316) && (@previous_pos_y > 60 && @previous_pos_y < 360) && (x > 0 && x < 320) && (y > 60 && y < 360)

						colour1 = line(@previous_pos_x, @previous_pos_y, x,y)
						colour2 = line(@previous_pos_x+320, @previous_pos_y, x+320,y)  
						#c 
					end
				end
				
				@previous_pos_x = x
				@previous_pos_y = y
			end  
		end
			
		def choose_colours
			click do |button, x, y|
				if button == 1
					#color
					if (y > 360 && y < 400) && (x > 0 && x < 40)
						stroke "#8C5001"
						puts "brush is now red"
					end
							
					if (y > 360 && y < 400) && (x > 40 && x < 80)
						stroke "#E36C0B"
						puts "brush is now orange"
					end
							
					if (y > 360 && y < 400) && (x > 80 && x < 120)
						stroke "#DEF200"
						puts "brush is now yellow"
					end
							
					if (y > 360 && y < 400) && (x > 120 && x < 160)
						stroke "#1CF200"
						puts "brush is now green"              
						
					end
							
					if (y > 360 && y < 400) && (x > 160 && x < 200)
						stroke "#00F2E6"
						puts "brush is now sky blue"              
					end
							
					if (y > 360 && y < 400) && (x > 200 && x < 240)
						stroke "#2400F2"
						puts "brush is now navy blue"              
					end
							
					if (y > 360 && y < 400) && (x > 240 && x < 280)
						stroke "#8500F2"
						puts "brush is now purple"              
					end	
						
					#eraser
					if (y > 360 && y < 400) && (x > 280 && x < 320)
						stroke "#B7C5C9"
						puts "brush is now grey"
					end	         
				end
			end  
		end 
    
    choose_colours
    paint_prota     
end

