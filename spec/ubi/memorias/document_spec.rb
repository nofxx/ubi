require 'spec_helper'

describe Memoria::Document do
  describe 'simple test' do
    subject { Memoria::Document.parse('bla bla 5 12.345.678/0001-90 79 so') }

    it { is_expected.to include(Memoria::Document) }
    it { is_expected.to be_an Array }
  end

  describe 'brazilian CNPJ' do
    def parse(document)
      Memoria::Document.parse(document).first.to_s
    end

    let(:parsed) { '12.345.678/0001-90' }

    it { expect(parse('12345678000190')).to eq(parsed) }
    it { expect(parse('123456780001-90')).to eq(parsed) }
    it { expect(parse('12345678/0001-90')).to eq(parsed) }
    it { expect(parse('12345.678/0001-90')).to eq(parsed) }
    it { expect(parse('12.345.678/0001-90')).to eq(parsed) }
  end

  describe 'not documents' do
    %w(
      1234
      12345
      123456
      1234567
      123@email.com
      11982345678
      11 982345678
      11-982345678
      11.982345678
      11-98234-5678
      11  982345678
      (11)982345678
      (11)98234-5678
      (11) 98234-5678
      (11) 98234.5678
    ).each do |bad_document|
      it "should not parse '#{bad_document}'" do
        expect(Memoria::Document.parse(bad_document).first).to be_nil
      end
    end
  end
end
