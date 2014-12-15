def fill_airport
  6.times { airport.accept(plane)}
end

describe Plane do

  let(:plane) { Plane.new }

  # it 'has a flying status when created' do
  #   expect(plane).to eq("flying")
  # end

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