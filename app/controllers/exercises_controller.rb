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
    @exercises = Exercise.order(:bodypart)
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  def body_parts_array
    Exercise.all.map {|ex| [ex.bodypart, ex.id] }
  end

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