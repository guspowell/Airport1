require 'airport'
require 'plane'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {double :plane}
  # let(:stormy_airport) {double :airport}

  context 'taking off and landing' do

    it 'can accept a plane for landing' do
      allow(plane).to receive(:land)
      allow(airport).to receive(:stormy?) {false}
      expect(airport.plane_count).to eq(0)
      airport.accept(plane)
      expect(airport.plane_count).to eq(1)
    end

    it 'must allow a plane to take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(airport).to receive(:stormy?) {false}
      airport.accept(plane)
      expect(airport.plane_count).to eq(1)
      airport.launch(plane)
      expect(airport.plane_count).to eq(0)
    end
  end

  context 'traffic control' do

    it 'should know when it is full' do
      allow(plane).to receive(:land)
      allow(airport).to receive(:stormy?).and_return false
      fill_airport
      expect(airport).to be_full
    end

    it 'a plane cannot land if the airport is full' do
      allow(plane).to receive(:land)
      allow(airport).to receive(:stormy?) {false}
      fill_airport
      expect(lambda { airport.accept(plane)}).to raise_error(RuntimeError, "sorry the airport is full")
    end


    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(airport).to receive(:stormy?) {true}
        expect(lambda { airport.launch(plane)}).to raise_error(RuntimeError, "too stormy to take off")
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:stormy?) {true}
        expect(lambda {airport.accept(plane)}).to raise_error(RuntimeError, "too stormy to land")
      end

      it 'weather should randomize every day' do
        airport.next_day
        expect(["sunny", "stormy"].include?(airport.conditions)).to eq true
      end

    end

  end

def fill_airport
  6.times { airport.accept(plane)}
end

end