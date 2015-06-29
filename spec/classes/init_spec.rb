require 'spec_helper'

describe 'kibana', :type => :class do

  let (:facts) { {
    :operatingsystem => 'CentOS',
    :kernel => 'Linux',
    :osfamily => 'RedHat',
    :operatingsystemmajrelease => '7',
    :http_proxy => false,
    :https_proxy => false,
    :architecture => 'amd64'
  } } 

  it { should contain_class('kibana::install') }
  it { should contain_class('kibana::config') }
  it { should contain_class('kibana::service') }

end
