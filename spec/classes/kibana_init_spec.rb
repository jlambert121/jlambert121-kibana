require 'spec_helper'

describe 'kibana', :type => :class do
  let(:facts) { {
    :ipaddress => '10.0.0.1',
    :osfamily => 'RedHat',
    :concat_basedir => '/var/lib/puppet/concat',
    :id => 0,
    :path => '/tmp'
  } }

  it { should contain_class('kibana::package') }
  it { should contain_class('kibana::config') }

end

