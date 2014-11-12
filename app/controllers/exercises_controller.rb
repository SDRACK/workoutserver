class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

#framework is working!! need a cleaner way to generate the workouts. also need to capitalize the input of exercises. finally, need to accept 
#all bodypart params, not just those names currently
#update - not ideal solution, though working dropdown to ensure params for bodypart work, though would rather the routines controller accepted
#all BP types as params, I think.
#would still like to implement an optional quantity param for routine to add, say, 3 core exercises to a workout.
#would also like to add admin at some point for editing.

  # GET /exercises
  # GET /exercises.json
  def index

    
    #if params[:bodypart_selector]
     # @exercises = Exercise.order(params[:bodypart_selector].to_sym)

    #else
      @exercises = Exercise.order(:bodypart)
    #end

    def sorter(bp)
      Exercise.where(bodypart: bp).all
    end

    @legs = sorter('legs')
    @back = sorter('back')
    @chest = sorter('chest')
    @shoulders = sorter('shoulders')
    @full = sorter('full')
    @core = sorter('core')
     # where(bodypart: 'Legs') #wanna drop params into here using something entered in the index page
  end

  def generator

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
  end

#suggested way to get params working for @bodypart, though it fails in config routes
#def bp
#end

#def pick_bp
#  bp = params[:bp]
#end
   
  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  #def body_parts_array
   # Exercise.all.map {|ex| [ex.bodypart, ex.id] }
  #end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)
    
    #if @exercise[exercise_params].is_a? String do |x|
     # x.titleize
    #end

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercises_path, notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to exercises_path, notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:move, :bodypart, :reps, :description)
    end

    
end