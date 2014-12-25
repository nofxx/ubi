require 'spec_helper'

describe Memoria::Phone do
  describe 'simple test' do
    subject { Memoria::Phone.parse('bla bla +551112345678') }

    it { is_expected.to include(Memoria::Phone) }
    it { is_expected.to be_an Array }
  end

  describe 'valid' do
    %w(
      1112345678
      (11)12345678
      (11)1234-5678
      551112345678
      +551112345678
      +5511-12345678
      (55)1112345678
    ).each do |good_phone|
      it "should correctly parse '#{good_phone}'" do
        res = Memoria::Phone.parse(good_phone)
        expect(res.size).to eq(1)
        expect(res.first.to_s).to eq(good_phone)
      end
    end
  end

  describe 'invalid' do
    %w(
      1234
      12345
      123456
      1234567
    ).each do |bad_phone|
      it "should not parse '#{bad_phone}'" do
        expect(Memoria::Phone.parse(bad_phone).first).to be_nil
      end
    end
  end
end
