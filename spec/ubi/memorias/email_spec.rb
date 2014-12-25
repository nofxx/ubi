require 'spec_helper'

describe Memoria::Email do
  describe 'simple test' do
    subject { Memoria::Email.parse('bla bla me@somesite.com') }

    it { is_expected.to be_an Array }
  end
end
