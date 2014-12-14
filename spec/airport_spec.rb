require 'airport'
require 'plane'

# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

def fill_airport
  6.times { airport.accept(plane)}
end

describe Plane do

  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane.initialize).to eq("flying")
  end

  it 'can land' do
    expect(plane.land).to eq("grounded")
  end

  it 'can take off' do
    expect(plane.take_off).to eq("flying")
  end

  # it 'has a flying status when in the air' do
  #   plane.land
  #   plane.take_off
  #   expect(plane.land).to eq("flying")
  # end

end


# # A plane currently in the airport can be requested to take off.
# #
# # No more planes can be added to the airport, if it's full.
# # It is up to you how many planes can land in the airport and how that is impermented.
# #
# # If the airport is full then no planes can land

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) {double :plane}

  context 'taking off and landing' do

    it 'can accept a plane for landing' do
      allow(plane).to receive(:land!)
      allow(airport).to receive(:stormy?) {false}
      expect(airport.plane_count).to eq(0)
      airport.accept(plane)
      expect(airport.plane_count).to eq(1)
    end

    it 'allow a plane to take off' do
      allow(plane).to receive(:land!)
      allow(plane).to receive(:take_off!)
      allow(airport).to receive(:stormy?) {false}
      airport.accept(plane)
      expect(airport.plane_count).to eq(1)
      airport.launch(plane)
      expect(airport.plane_count).to eq(0)
    end
  end

  context 'traffic control' do

    it 'should know when it is full' do
      allow(plane).to receive(:land!)
      allow(airport).to receive(:stormy?) {false}
      fill_airport
      expect(airport).to be_full
    end

    it 'a plane cannot land if the airport is full' do
      allow(plane).to receive(:land!)
      allow(airport).to receive(:stormy?) {false}
      fill_airport
      expect(lambda { airport.accept(plane)}).to raise_error(RuntimeError, "sorry the airport is full")
    end

#     # Include a weather condition using a module.
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
#     # 
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(airport).to receive(:stormy?) {true}
        expect(lambda { airport.launch(plane)}).to raise_error(RuntimeError, "too stormy to take off")
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:stormy?) {true}
        expect(lambda {airport.accept(plane)}).to raise_error(RuntimeError, "too stormy to land")
      end

    end

end


# # grand final
# # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# # Be careful of the weather, it could be stormy!
# # Check when all the planes have landed that they have the right status "landed"
# # Once all the planes are in the air again, check that they have the status of flying!

# describe "The grand finale (last spec)" do

  it 'all planes can land and all planes can take off' do
    allow(plane).to receive(:land!)
    allow(airport).to receive(:stormy?) {false}
    fill_airport
    expect(@planes).not_to be_flying
  end
end