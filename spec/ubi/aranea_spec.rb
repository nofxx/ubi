require 'spec_helper'

describe Aranea do
  it 'should delegate name to thema' do
    aranea = Thema.new('Rock', ['rock.com']).araneas.first
    expect(aranea.name).to eq('Rock')
  end

  it 'should use only one url' do
    aranea = Thema.new('Rock', ['r1.com', 'r2.com']).araneas.first
    expect(aranea.url).to eq('r1.com')
  end

  # it 'should crawl a domain VCR ruby-lang', :vcr do
  #   ruby = Thema.new('fire', ['http://fireho.com'])
  #   ar = ruby.araneas.first
  #   expect(ar.datum).to match(/oi/)
  # end
end
