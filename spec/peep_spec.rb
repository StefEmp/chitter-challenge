require 'peep'
describe '.create' do
  it 'creates a new peep' do
    Peep.create(post: 'I am alive or am I')
    expect(Peep.all).to include 'I am alive or am I'
  end
end