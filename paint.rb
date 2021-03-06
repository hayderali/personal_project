require 'green_shoes'
require './protanopia'
#main class 
 
class Paint 
  attr_accessor :previous_pos_x,:previous_pos_y,:brush_size,:decrease_size,:increase_size,:clean_slate

  #setting the window size   
  Shoes.app title: "Paint Project",:width => 640, :height => 400 do
  	
		#brush variables
		@previous_pos_x 
		@previous_pos_y
		@brush_size = 8
		
		#buttons
		@increase_size = button "Brush Size +"
		@decrease_size = button "Brush Size -"
		@clean_slate = button "Wipe Page"
		@paint_change = button "Protanopia"
				
		@brush_prota = false
		@brush = true 
	
		#gui colours
		def draw_screen	
			background "#FFFFFF"
			strokewidth(1)
			stroke("#000000")
			#border
			line(322,0,322,400)
			#squares 
			red = rect 0, 360, 40, 40, :fill => "#E30B0B"
			orange = rect 40, 360, 40, 40, :fill => "#E36C0B"
			yellow = rect 80, 360, 40,40, :fill => "#DEF200"
			green = rect  120, 360, 40, 40, :fill => "#1CF200"
			blue = rect  160, 360, 40, 40, :fill => "#00F2E6"			
			navy_blue = rect 200, 360, 40, 40, :fill => "#2400F2"
			purple = rect 240, 360, 40, 40, :fill => "#8500F2"
			black = rect 280, 360, 40, 40, :fill => "#000000"
		
			#protanopia
			red = rect 320, 360, 40, 40, :fill => "#8C5001"
			orange = rect 360, 360, 40, 40, :fill => "#DBAD16"
			yellow = rect 400, 360, 40,40, :fill => "#FAF9F7"
			green = rect  440, 360, 40, 40, :fill => "#DFE62E"
			blue = rect  480, 360, 40, 40, :fill => "#CCD1F0"			
			navy_blue = rect 520, 360, 40, 40, :fill => "#2400F2"
			purple = rect 560, 360, 40, 40, :fill => "#024694"
			black = rect 600, 360, 40, 40, :fill => "#000000"		
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
			
			@paint_change.click do 
				if @brush_prota == true 
						@brush_prota = false
				elsif @brush_prota == false
					@brush_prota = true
				
				end
			puts @brush_prota	
			end

		end
	
		def choose_colours
			click do |button, x, y|
				if button == 1
					if (y > 360 && y < 400) && (x > 0 && x < 40) 	
						if @brush_prota == true
							stroke "#8C5001" 
							puts "brush is now prota red"
						else 
							stroke "#E30B0B"
							puts "brush is now red"
						end
					end		
	
					if (y > 360 && y < 400) && (x > 40 && x < 80)
						if @brush_prota == true
							stroke "#DBAD16" 
							puts "brush is now prota orange"
						else 
							stroke "#E36C0B"
							puts "brush is now orange"
						end
					end		

					if (y > 360 && y < 400) && (x > 80 && x < 120)
						if @brush_prota == true
							stroke "#FAF9F7" 
							puts "brush is now prota yellow"
						else 
							stroke "#DEF200"
							puts "brush is now yellow"
						end	
					end
						
					if (y > 360 && y < 400) && (x > 120 && x < 160)
						if @brush_prota == true
							stroke "#DFE62E" 
							puts "brush is now prota green"
						else 
							stroke "#1CF200"
							puts "brush is now green"
						end            			
					end
						
					if (y > 360 && y < 400) && (x > 160 && x < 200)
						if @brush_prota == true
							stroke "#CCD1F0" 
							puts "brush is now prota sky blue"
						else 
							stroke "#00F2E6"
							puts "brush is now sky blue" 
						end               
					end	
					
					if (y > 360 && y < 400) && (x > 200 && x < 240)
						if @brush_prota == true
							stroke "#2400F2" 
							puts "brush is now prota navy blue"
						else 
							stroke "#2400F2"
							puts "brush is now navy blue" 
						end 	            
					end
						
					if (y > 360 && y < 400) && (x > 240 && x < 280)
						if @brush_prota == true
							stroke "#024694" 
							puts "brush is now prota purple"
						else 
							stroke "#8500F2"
							puts "brush is now purple" 
						end 	                         
					end	
					
					#grey colour
					if (y > 360 && y < 400) && (x > 280 && x < 320)
						stroke "#000000"
						puts "brush is now black"
					end	         
				end
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
							l1 =	line(@previous_pos_x, @previous_pos_y, x,y)		
					end
				end
				
				if button == 1
					if (@previous_pos_x > 2 && @previous_pos_x < 316) && (@previous_pos_y > 60 && @previous_pos_y < 360) && (x > 0 && x < 320) && (y > 60 && y < 360) 
					
						l2	= line(@previous_pos_x +320, @previous_pos_y, x+320,y)
					end
				end
	
				@previous_pos_x = x
				@previous_pos_y = y
			end  
		end
				
		draw_screen
		button
		choose_colours
		paint_normal
		
	end 
end
	
