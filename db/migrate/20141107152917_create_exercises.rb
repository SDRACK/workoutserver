class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :move
      t.string :bodypart
      t.integer :reps

      t.timestamps
    end
  end
end
