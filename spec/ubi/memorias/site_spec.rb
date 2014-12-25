require 'spec_helper'

describe Memoria::Site do
  describe 'simple test' do
    subject { Memoria::Site.parse('bla bla me@somesite.com') }

    it { is_expected.to include(Memoria::Site) }
    it { is_expected.to be_an Array }
  end

  describe 'valid' do
    %w(
      oo.com
      oo.org
      oo.net
      foo.net
      foo.net
      foo.net
      foo.net
      9foo.net
      land.com.br
      land.org.br
      land.net.br
      dom.land.co.uk
      ad.dom.land.co.tk
    ).each do |good_site|
      it "should correctly parse '#{good_site}'" do
        res = Memoria::Site.parse(good_site)
        expect(res.first.to_s).to eq(good_site)
        expect(res.size).to eq(1)
      end
    end
  end

  describe 'invalid' do
    %w(
      @foo
      foo@foo
      @foo.org
      zumbi@.com
      foo@@foo.com
      zum.@good.com
      @11 53 2355
      @11532355
    ).each do |bad_site|
      it "should not parse '#{bad_site}'" do
        expect(Memoria::Site.parse(bad_site).first).to be_nil
      end
    end
  end
end
