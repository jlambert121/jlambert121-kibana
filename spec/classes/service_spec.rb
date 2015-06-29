require 'spec_helper'

describe 'kibana::service', :type => :class do

  let (:facts) { {
    :operatingsystem => 'CentOS',
    :kernel => 'Linux',
    :osfamily => 'RedHat',
    :http_proxy => false,
    :https_proxy => false,
    :operatingsystemmajrelease => '7',
    :architecture => 'amd64',
  } }

  context 'with defaults for all parameters' do

    it { should contain_service('kibana') }

    let(:pre_condition) { 'include kibana' }

  end

end
