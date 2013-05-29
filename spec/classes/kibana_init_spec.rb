require 'spec_helper'

describe 'kibana', :type => :class do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat' } }

  it { should include_class('kibana::package') }
  it { should include_class('kibana::config') }

end

