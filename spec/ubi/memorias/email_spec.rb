require 'spec_helper'

describe Memoria::Email do
  describe 'simple test' do
    subject { Memoria::Email.parse('bla bla me@somesite.com') }

    it { is_expected.to include(Memoria::Email) }
    it { is_expected.to be_an Array }
  end

  describe 'valid' do
    %w(
      foo@foo.com
      foo@foo.org
      foo@foo.net
      foo_bar@foo.net
      foo-bar@foo.net
      foo.bar@foo.net
      foo.bar9@foo.net
      foo.bar@99foo.net
      zumbi@land.com.br
      zumbi@land.org.br
      zumbi@land.net.br
      zum@dom.land.co.uk
      zum@ad.dom.land.co.tk
    ).each do |good_mail|
      it "should correctly parse '#{good_mail}'" do
        res = Memoria::Email.parse(good_mail)
        expect(res.first.to_s).to eq(good_mail)
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
    ).each do |bad_mail|
      it "should not parse '#{bad_mail}'" do
        expect(Memoria::Email.parse(bad_mail).first).to be_nil
      end
    end
  end
end
