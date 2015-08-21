require 'spec_helper'

describe Memoria::Phone do
  describe 'simple test' do
    subject { Memoria::Phone.new('+551112345678') }

    it { is_expected.to be_a Memoria::Phone }

    it 'should have text reader method' do
      expect(subject.text).to eq('+551112345678')
    end

    it 'should have text reader method' do
      expect(subject.number).to be_a Phonelib::Phone
    end
  end

  describe 'ill formated simple test' do
    subject { Memoria::Phone.new('+55(11) 1234-5678') }

    it { is_expected.to be_a Memoria::Phone }

    it 'should have text reader method' do
      expect(subject.text).to eq('+55(11) 1234-5678')
    end

    it 'should have text reader method' do
      expect(subject.number).to be_a Phonelib::Phone
    end
  end

  describe 'parsed landlines' do
    def parse(phone)
      Memoria::Phone.parse(phone).first.rfc
    end

    let(:parsed) { '+1112345678' }

    load_fixture('phone.txt').each_line do |l|
      it "Should parse phone #{l}" do
        expect(parse(l)).to eq(parsed)
      end
    end
  end

  describe 'parsed mobiles txt' do
    def parse(phone)
      Memoria::Phone.parse(phone).first.rfc
    end

    let(:parsed) { '+11998145678' }

    load_fixture('mobile.txt').each_line do |l|
      it "Should parse phone #{l}" do
        expect(parse(l)).to eq(parsed)
      end
    end
  end

  describe 'parsed mobiles' do
    def parse(phone)
      Memoria::Phone.parse(phone).first.rfc
    end

    let(:parsed) { '+11982345678' }

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
      12.345.678/0001-90
      12345678000190
      069.789.136-45
      123456@ema5678.com
    ).each do |bad_phone|
      it "should not parse '#{bad_phone}'" do
        expect(Memoria::Phone.parse(bad_phone).first).to be_nil
      end
    end
  end
end
