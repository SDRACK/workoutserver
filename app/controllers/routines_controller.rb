class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  # GET /routines
  # GET /routines.json
  def index
    
    @gen = Exercise.pluck(:move, :bodypart, :reps)
    @gen.shuffle!

    #superfluous with list for bodypart - might need to come back if I do away with that *edit* seems I do need it, probs for the to_s
    @gen.each do |m, bp, r| 
      bp.to_s.capitalize!
    end

    def selector(bp)
      @gen.select { |a, b, c| b == bp }
    end

  
   @generator = Exercise::BODYPART_OPTIONS.map.with_index{ |bp_type, i| selector(bp_type).first }
   @generator.shuffle!
   #@arr2.reject! { |arr| arr[1] == 'Core' }

   #throw @arr2

#@bodyparts = ["Full", "Legs", "Back", "Core", "Shoulders", "Chest"]
   # @generator = [@generatorl = selector("legs").first, @generatorb = selector("back").first, @generators = selector("stomach").first, @generatorsh = selector("shoulders").first, @generatorc = selector("chest").first]
   #@generator = [selector("Full").first, selector("Legs").first, selector("Back").first, selector("Core").first, selector("Shoulders").first, selector("Chest").first]


   #@bodyparts.each do |x|; selector(x).first; end


 # def quant(x = 1)
    #  first(x)
    #end
    
   #
  

  


   # @e = Exercise[:bodypart].each do |

#now superfluous - dried code above
    #@generatorl = @gen.select { |a, b, c| b == "legs" } # feel b.downcase should work to grab capital :bodyparts, though not working for now
    #@generatorl = @generatorl.first
  
    #@generatorb = @gen.select { |a, b, c| b == "back" }
    #@generatorb = @generatorb.first
  
    #@generators = @gen.select { |a, b, c| b == "stomach" }
    #@generators = @generators.first
  
    #@generatorsh = @gen.select { |a, b, c| b == "shoulders" }
    #@generatorsh = @generatorsh.first
  
    #@generatorc = @gen.select { |a, b, c| b == "chest" }
    #@generatorc = @generatorc.first
  
  #@generator = @generatorl, @generatorb, @generators, @generatorsh, @generatorc
  #@generator.shuffle!
  end

  # GET /routines/1
  # GET /routines/1.json
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routine_params
      params.require(:routine).permit(:move, :bodypart, :reps)
    end
end
