require 'spec_helper'

describe Thema do

  it 'should have a name' do
    expect(Thema.new('Hard Rock').name).to eq('Hard Rock')
  end

  it 'should have many memorias' do
    expect(Thema.new('Foo').memorias).to be_an(Array)
  end

  it 'should access memorias by type' do
    expect(Thema.new('Foo')).to respond_to(:emails)
  end


end
