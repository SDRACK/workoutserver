class Exercise < ActiveRecord::Base
	belongs_to :routine

	BODYPART_OPTIONS = [ "Core", "Chest", "Shoulders", "Back", "Full", "Legs" ]
end
