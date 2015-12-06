require 'green_shoes'
require 'spec_helper'

  before :all do 

      #load these variables into the program
      
      #brush variables
      @previous_pos_x 
      @previous_pos_y
      @brush_size = 8
        
      #gui colours
      background "#FFFFFF"
      strokewidth(1)
      stroke("#000000")
      #border
      line(322,0,322,400)
      #1 square for testing 
      red = rect 0, 360, 40, 40, :fill => "#E30B0B"
      
      #buttons
      @increase_size = button "Brush Size +"
      @decrease_size = button "Brush Size -"
      @clean_slate = button "Wipe Page"
    
    end

  
	describe "Paint Functionality" do

    
      
    it "brush size is default 8" do
      expect(brush_size).to eq(8)
    end
    
    it "background value is white " do
      expect (background).contains("#FFFFFF") 
    end
    
    it "rectangle should be at the bottom of the screen by 40x40"
      expect(red).contains ("0,360,40,40")
      expect(red.fill).to eq("#E30BOB")
    end
      