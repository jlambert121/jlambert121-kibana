require 'spec_helper'

describe 'kibana::package', :type => :class do

  let(:params) { { :ensure => '20130529' } }
  it { should contain_package('kibana').with_ensure('20130529') }

end

