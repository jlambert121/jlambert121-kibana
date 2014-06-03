require 'spec_helper'

describe 'kibana', :type => :class do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat' } }

  it { should contain_class('kibana::package') }
  it { should contain_class('kibana::config') }

end

