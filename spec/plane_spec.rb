
describe Plane do

  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane.plane_status).to eq("flying")
  end

  it 'can land' do
    plane.land
    expect(plane.plane_status).to eq("grounded")
  end

  it 'can take off' do
    plane.land
    plane.take_off
    expect(plane.plane_status).to eq("flying")
  end

  it 'has a flying status when in the air' do
    plane.land
    plane.take_off
    expect(plane.plane_status).to eq("flying")
  end

end