require 'airport'
require 'plane'

# # grand final
# # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# # Be careful of the weather, it could be stormy!
# # Check when all the planes have landed that they have the right status "landed"
# # Once all the planes are in the air again, check that they have the status of flying!


# def fill_airport
#   6.times do
#   	airport.accept(plane)
#   end
# end

describe "The grand finale (last spec)" do

  let(:airport) { Airport.new }
  let(:plane) {Plane.new}

  before do 
  	@planes = []
  	6.times {@planes << Plane.new}
  	allow(airport).to receive(:stormy?).and_return false
  end

  it "can land planes " do 
  	@planes.each{|plane|airport.accept(plane)}
  	expect(airport.plane_count).to eq 6
  end


  it "can take off planes " do 
  	@planes.each{|plane|airport.accept(plane)}
  	@planes.each{|plane|airport.launch(plane)}
  	expect(airport.plane_count).to eq 0
  end

   it "can land planes know when a plane is landed " do 
  	@planes.each{|plane|airport.accept(plane)}
  	expect(@planes.map{|plane|plane.plane_status}.uniq).to eq ["grounded"]
  end

   it "can land planes know when a plane is flying " do
  	@planes.each{|plane|airport.accept(plane)}
  	@planes.each{|plane|airport.launch(plane)}
  	expect(@planes.map{|plane|plane.plane_status}.uniq).to eq ["flying"]
  end

end