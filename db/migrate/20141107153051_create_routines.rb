class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :move
      t.string :bodypart
      t.integer :reps

      t.timestamps
    end
  end
end
