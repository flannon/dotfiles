require 'spec_helper'
describe 'vim' do
  context 'with default values for all parameters' do
    it { should contain_class('vim') }
  end
end
