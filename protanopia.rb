require 'green_shoes'
require './paint'
#store another brush
 

class Protanopia < Paint
  attr_accessor :previous_pos_x,:previous_pos_y,:brush_size,:decrease_size,:increase_size,:clean_slate
  #setting the window size   
  
  #normal paint
  #Shoes.app title: "Paint Project",:width => 640, :height => 400 do
		def initialize(x,y,b_size,big,small,clean)
			
			super(x,y,b_size,big,small,clean)

		end

			@previous_pos_x 
			@previous_pos_y
			@brush_size = 8
			
			#buttons
			@increase_size = button "Brush Size +"
			@decrease_size = button "Brush Size -"
			@clean_slate = button "Wipe Page"
		
		#gui colours
		def draw_screen
			stroke "#E30B0B"
			background "#FFFFFF"
			strokewidth(1)
			line(322,0,322,400)
			#brush variables
		
			stroke("#000000")
			
			#protanopia
			red = rect 320, 360, 40, 40, :fill => "#8C5001"
			orange = rect 360, 360, 40, 40, :fill => "#DBAD16"
			yellow = rect 400, 360, 40,40, :fill => "#FAF9F7"
			green = rect  440, 360, 40, 40, :fill => "#DFE62E"
			blue = rect  480, 360, 40, 40, :fill => "#CCD1F0"			
			navy_blue = rect 520, 360, 40, 40, :fill => "#2400F2"
			purple = rect 560, 360, 40, 40, :fill => "#024694"
			grey = rect 600, 360, 40, 40, :fill => "#B7C5C9"
		end
			
		def button 
			message = para "Brush size is: " + @brush_size.to_s
			@increase_size.click do
				@brush_size = @brush_size + 4
				message.replace "Brush size is: " + @brush_size.to_s
			end
			
			@decrease_size.click do
				@brush_size = @brush_size - 4
				message.replace "Brush size is: " + @brush_size.to_s
			end
			
			@clean_slate.click do
				nostroke
				clear_left = rect 0, 45, 321, 315, :fill => "#FFFFFF" 
				clear_right = rect 322, 45, 640, 315, :fill => "#FFFFFF" 
			end
		end
			
		def paint_normal 
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
						stroke "#E30B0B"
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
    
		draw_screen
    choose_colours
    button
    paint_normal
    
    
  #end    
end
