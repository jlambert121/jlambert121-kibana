require 'spec_helper'

describe 'kibana::service', :type => :class do

  it { should contain_service('kibana') }

end
