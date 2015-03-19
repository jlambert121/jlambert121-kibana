require 'spec_helper'

describe 'kibana::install', :type => :class do

  let(:facts) { {
    :kernel => 'Linux',
    :http_proxy => false,
    :https_proxy => false,
  } }

  let(:params) { {
    :version  => '4.0.0',
    :base_url => 'https://download.elasticsearch.org/kibana/kibana',
    :install_path => '/opt',
    :tmp_dir => '/tmp'
  } }

  it { should contain_user('kibana') }
  it { should contain_group('kibana') }
  it { should contain_wget__fetch('kibana').with(
    :source => 'https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-linux-x64.tar.gz',
    :destination => '/tmp/kibana-4.0.0-linux-x64.tar.gz'
  ) }
  it { should contain_exec('extract_kibana').with(:command => 'tar -xzf /tmp/kibana-4.0.0-linux-x64.tar.gz -C /opt' ) }
  it { should contain_file('/opt/kibana').with(:target => '/opt/kibana-4.0.0-linux-x64') }
  it { should contain_file('/usr/lib/systemd/system/kibana.service').with(:content => /ExecStart=\/opt\/kibana\/bin\/kibana/) }

end
