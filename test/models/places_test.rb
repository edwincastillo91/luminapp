require 'test_helper'
class PlacesTest < ActiveSupport::TestCase
	
	def setup
		Univers.create(name: "Yolo1")
		@place = @univers.places.new(name: "YOLO")
	end
	
	
	test "place should be valid" do
		assert @place.valid?
	end
end