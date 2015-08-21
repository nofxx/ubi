require 'spec_helper'

describe Memoria::Site do
  describe 'simple test' do
    subject { Memoria::Site.parse('bla bla somesite.com') }

    it { is_expected.to include(Memoria::Site) }
    it { is_expected.to be_an Array }

    it 'should have text reader method' do
      expect(subject[0].text).to eq('somesite.com')
    end
  end

  describe 'parsed' do
    def parse(site)
      Memoria::Site.parse(site).first.to_s
    end

    describe 'http' do
      let(:parsed) { 'http://fubah.com' }

      it { expect(parse('fubah.com')).to eq(parsed) }
      it { expect(parse('@fubah.com')).to eq(parsed) } # 'http://@fubah.com') }
      it { expect(parse('fu@fubah.com')).to eq(parsed) } # 'http://fu@fubah.com') }
      it { expect(parse('http://fubah.com')).to eq(parsed) }
      it { expect(parse('http://fubah.com/56')).to eq(parsed + '/56') }
    end

    describe 'https' do
      let(:parsed) { 'https://fubah.com' }

      it { expect(parse('https://fubah.com')).to eq(parsed) }
      it { expect(parse('https://fubah.com?56')).to eq(parsed + '?56') }
    end

    describe 'subdomain' do
      let(:parsed) { 'http://www.fubah.com' }

      it { expect(parse('www.fubah.com')).to eq(parsed) }
      it { expect(parse('http://www.fubah.com')).to eq(parsed) }
      it { expect(parse('http://www.fubah.com/f?56')).to eq(parsed + '/f?56') }
    end
  end

  describe 'valid http' do
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
      http://foo.com
      http://www.foo.com
    ).each do |good_site|
      it "should correctly parse '#{good_site}'" do
        res = Memoria::Site.parse(good_site)
        good_site = "http://#{good_site}" if good_site !~ /http/
        expect(res.first.to_s).to eq(good_site)
        expect(res.size).to eq(1)
      end
    end
  end

  describe 'invalid' do
    %w(
      @foo
      foo@foo
      zumbi@.com
      @11 53 2355
      @11532355
    ).each do |bad_site|
      it "should not parse '#{bad_site}'" do
        expect(Memoria::Site.parse(bad_site).first).to be_nil
      end
    end
  end
end
