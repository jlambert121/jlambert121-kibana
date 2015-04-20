require 'spec_helper'

describe 'kibana::install', :type => :class do

  let(:facts) { {
      :kernel => 'Linux',
      :http_proxy => false,
      :https_proxy => false,
    } }

  context 'with legacy_service_mode => false' do
    let(:params) { {
        :version  => '4.0.0',
        :base_url => 'https://download.elasticsearch.org/kibana/kibana',
        :install_path => '/opt',
        :tmp_dir => '/tmp',
        :legacy_service_mode => false}
    }

    it { should contain_user('kibana') }
    it { should contain_group('kibana') }
    it { should contain_wget__fetch('kibana').with(
      :source => 'https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-linux-x64.tar.gz',
      :destination => '/tmp/kibana-4.0.0-linux-x64.tar.gz'
      ) }
    it { should contain_exec('extract_kibana').with(:command => 'tar -xzf /tmp/kibana-4.0.0-linux-x64.tar.gz -C /opt' ) }
    it { should contain_file('/opt/kibana').with(:target => '/opt/kibana-4.0.0-linux-x64') }
    it { should contain_file('/usr/lib/systemd/system/kibana.service').with(:content => /ExecStart=\/opt\/kibana\/bin\/kibana/) }
    it { should contain_file('/var/log/kibana').with({
        'ensure'  => 'directory',
        'owner'   => 'kibana',
        'group'   => 'kibana'
      }).that_requires('User[kibana]') }
  end

  context 'with legacy_service_mode => true' do
    let(:params) { {
        :version  => '4.0.0',
        :base_url => 'https://download.elasticsearch.org/kibana/kibana',
        :install_path => '/opt',
        :tmp_dir => '/tmp',
        :legacy_service_mode => true}
    }

    it { should contain_user('kibana') }
    it { should contain_group('kibana') }
    it { should contain_wget__fetch('kibana').with(
      :source => 'https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-linux-x64.tar.gz',
      :destination => '/tmp/kibana-4.0.0-linux-x64.tar.gz'
      ) }
    it { should contain_exec('extract_kibana').with(:command => 'tar -xzf /tmp/kibana-4.0.0-linux-x64.tar.gz -C /opt' ) }
    it { should contain_file('/opt/kibana').with(:target => '/opt/kibana-4.0.0-linux-x64') }
    it { should contain_file('/etc/init.d/kibana').with(:content => /description: Kibana is a web interface to Logstash./) }
    it { should contain_file('/var/log/kibana').with({
        'ensure'  => 'directory',
        'owner'   => 'kibana',
        'group'   => 'kibana',
      }).that_requires('User[kibana]') }
  end

end
