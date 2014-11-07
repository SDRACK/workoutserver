class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  # GET /routines
  # GET /routines.json
  def index
    @routines = Routine.all

    @gen = Exercise.pluck(:move, :bodypart, :reps)
    @gen.shuffle!

    @gen.each do |m, bp, r| 
      bp.to_s.capitalize!
    end

    def selector(bp)
      @gen.select { |a, b, c| b == bp }
    end

   # @generator = [@generatorl = selector("legs").first, @generatorb = selector("back").first, @generators = selector("stomach").first, @generatorsh = selector("shoulders").first, @generatorc = selector("chest").first]
   @generator = [selector("Legs").first, selector("Back").first, selector("Core").first, selector("Shoulders").first, selector("Chest").first]
  @generator.shuffle!


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
  def show
  end

  # GET /routines/new
  def new
    @routine = Routine.new
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines
  # POST /routines.json
  def create
    @routine = Routine.new(routine_params)

    respond_to do |format|
      if @routine.save
        format.html { redirect_to @routine, notice: 'Routine was successfully created.' }
        format.json { render :show, status: :created, location: @routine }
      else
        format.html { render :new }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routines/1
  # PATCH/PUT /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to @routine, notice: 'Routine was successfully updated.' }
        format.json { render :show, status: :ok, location: @routine }
      else
        format.html { render :edit }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1
  # DELETE /routines/1.json
  def destroy
    @routine.destroy
    respond_to do |format|
      format.html { redirect_to routines_url, notice: 'Routine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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
