class Exercise < ActiveRecord::Base
	BODYPART_OPTIONS = [ "Back", "Chest", "Core", "Full", "Legs", "Shoulders" ]

	validates :move, :bodypart, :reps, presence: true
	validates :reps, numericality: { greater_than: 0 }
	validates :move, uniqueness: true
end
