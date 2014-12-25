require 'spec_helper'

describe Memoria::Phone do
  describe 'simple test' do
    subject { Memoria::Phone.parse('bla bla +551112345678') }

    it { is_expected.to include(Memoria::Phone) }
    it { is_expected.to be_an Array }
  end

  describe 'parsed landlines' do
    def parse(phone)
      Memoria::Phone.parse(phone).first.to_s
    end

    let(:parsed) { '(11) 1234-5678' }

    it { expect(parse('1112345678')).to eq(parsed) }
    it { expect(parse('11 12345678')).to eq(parsed) }
    it { expect(parse('11-12345678')).to eq(parsed) }
    it { expect(parse('11.12345678')).to eq(parsed) }
    it { expect(parse('11-1234-5678')).to eq(parsed) }
    it { expect(parse('(11)12345678')).to eq(parsed) }
    it { expect(parse('(11)1234-5678')).to eq(parsed) }
  end

  describe 'parsed mobiles' do
    def parse(phone)
      Memoria::Phone.parse(phone).first.to_s
    end

    let(:parsed) { '(11) 9823-45678' }

    it { expect(parse('11982345678')).to eq(parsed) }
    it { expect(parse('11 982345678')).to eq(parsed) }
    it { expect(parse('11-982345678')).to eq(parsed) }
    it { expect(parse('11.982345678')).to eq(parsed) }
    it { expect(parse('11-98234-5678')).to eq(parsed) }
    it { expect(parse('11  982345678')).to eq(parsed) }
    it { expect(parse('(11)982345678')).to eq(parsed) }
    it { expect(parse('(11)98234-5678')).to eq(parsed) }
    it { expect(parse('(11) 98234-5678')).to eq(parsed) }
    it { expect(parse('(11) 98234.5678')).to eq(parsed) }
  end

  describe 'regex' do
    subject(:regex) { Memoria::Phone.regex }
    it { expect('(11) 98234.5678 547\n5475\n'.scan(regex).size).to eq(1) }
  end

  describe 'invalid' do
    %w(
      1234
      12345
      123456
      1234567
      123@email.com
    ).each do |bad_phone|
      it "should not parse '#{bad_phone}'" do
        expect(Memoria::Phone.parse(bad_phone).first).to be_nil
      end
    end
  end
end
