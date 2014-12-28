require 'spec_helper'

describe Memoria::Address do
  [
    'R Bahia,55 - Una/BR - 12345-678',
    'R Bahia,55 - Una/BR - 12345- 678',
    'R Bahia, 55 - Una/BR - 12345-678',
    'R Bahia, 55  - Una/BR - 12345-678',
    'R Bahia, 55 /  Una/BR - 12345-678',
    'R Bahia, 55 \n  Una/BR \n 12345-678',
    'R Bahia, 55,   Una/BR - 12345-678'
  ].each do |chunk|
    describe "simple delimited `#{chunk}`" do
      subject { Memoria::Address.parse(chunk) }

      it { is_expected.to be_an Array }
      it { expect(subject.size).to eq(1) }
      it { is_expected.to include(Memoria::Address) }

      describe 'instance' do
        let(:addr) { subject.first }

        it { expect(addr.zip.to_s).to eq('12345-678') }
        it { expect(addr.number.to_s).to eq('55') }
        it { expect(addr.region.to_s).to eq('BR') }

        it 'should split into parts' do
          expect(addr.parts).to eq(['R Bahia', '55', 'Una', 'BR', '12345-678'])
        end

        it 'should split into words' do
          expect(addr.words).to eq([['R', 'Bahia'], ['55'], ['Una'], ['BR'], ['12345-678']])
        end
      end
    end
  end

  describe 'sanitizing' do
    subject { Memoria::Address }
    it { expect(subject.sanitize('Fu Ba')).to eq('Fu Ba') }
    it { expect(subject.sanitize('Fu  Ba')).to eq('Fu Ba') }
    it { expect(subject.sanitize('Fu   Ba')).to eq('Fu Ba') }
    it { expect(subject.sanitize('Fu,   Ba')).to eq('Fu,Ba') }
    it { expect(subject.sanitize('Fu   ,Ba')).to eq('Fu,Ba') }
    it { expect(subject.sanitize('Fu ,   Ba')).to eq('Fu,Ba') }
    it { expect(subject.sanitize('Fu   ,  Ba')).to eq('Fu,Ba') }
    it { expect(subject.sanitize('Fu  ,   Ba')).to eq('Fu,Ba') }
    it { expect(subject.sanitize('123454-789')).to eq('123454-789') }
    it { expect(subject.sanitize('123454 -789')).to eq('123454-789') }
    it { expect(subject.sanitize('123454- 789')).to eq('123454-789') }
    it { expect(subject.sanitize('123454 - 789')).to eq('123454-789') }
    it { expect(subject.sanitize('foo,55 - Ubi')).to eq('foo,55-Ubi') }
    it { expect(subject.sanitize('foo,55 -  Ubi')).to eq('foo,55-Ubi') }
    it { expect(subject.sanitize('BR - 12345- 678')).to eq('BR-12345-678') }
  end

end
