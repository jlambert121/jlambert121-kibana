require 'spec_helper'

describe 'kibana', :type => :class do
  let(:facts) { {
    :kernel => 'Linux',
    :http_proxy => false,
    :https_proxy => false,
  } }

  it { should contain_class('kibana::install') }
  it { should contain_class('kibana::config') }
  it { should contain_class('kibana::service') }

end
