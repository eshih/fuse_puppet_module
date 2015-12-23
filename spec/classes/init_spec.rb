require 'spec_helper'
describe 'fuse' do

  context 'with defaults for all parameters' do
    it { should contain_class('fuse') }
  end
end
