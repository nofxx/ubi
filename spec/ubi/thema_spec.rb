require 'spec_helper'

describe Thema do
  it 'should have a name' do
    expect(Thema.new('Hard Rock').name).to eq('Hard Rock')
  end

  it 'should accept urls too' do
    expect(Thema.new('Hard Rock', ['hr.com']).urls).to include('http://hr.com')
  end

  it 'should convert urls to aranea' do
    expect(Thema.new('HR', ['hr.com']).araneas.first).to be_a(Aranea)
  end

  it 'should have many memorias' do
    expect(Thema.new('Foo').memorias).to be_an(Array)
  end

  it 'should access memorias by type' do
    expect(Thema.new('Foo')).to respond_to(:emails)
  end

  it 'should access sites by type' do
    expect(Thema.new('Foo')).to respond_to(:sites)
  end

  it 'should accept a site' do
    th = Thema.new('Ruby')
    th.sites << Memoria::Site.new('http://ruby-lang.org')
    expect(th.sites.size).to eq(1)
  end
end
