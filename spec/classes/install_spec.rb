require 'spec_helper'

describe 'kibana::install', :type => :class do

  default_facts = {
    :operatingsystem => 'CentOS',
    :kernel => 'Linux',
    :osfamily => 'RedHat',
    :http_proxy => false,
    :https_proxy => false,
    :architecture => 'amd64'
  }

  context 'with defaults for all parameters' do

    let (:facts) {
      default_facts.merge({
        :operatingsystemmajrelease => '7',
      })
    }

    let(:pre_condition) { 'include kibana'}

    it { should contain_user('kibana') }
    it { should contain_group('kibana') }
    it { should contain_wget__fetch('kibana').with(
      :source => 'https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz',
      :destination => '/tmp/kibana-4.0.1-linux-x64.tar.gz'
      ) }
    it { should contain_exec('extract_kibana').with(:command => 'tar -xzf /tmp/kibana-4.0.1-linux-x64.tar.gz -C /opt' ) }
    it { should contain_exec('ensure_correct_permissions').with(:command => 'chown -R kibana:kibana /opt/kibana-4.0.1-linux-x64', :require => ["Exec[extract_kibana]","User[kibana]"]) }
    it { should contain_file('/opt/kibana').with(:target => '/opt/kibana-4.0.1-linux-x64') }
    it { should contain_file('/var/log/kibana').with({
        'ensure'  => 'directory',
        'owner'   => 'kibana',
        'group'   => 'kibana'
      }).that_requires('User[kibana]') }

  end

  context 'with a different install_path' do

    let (:facts) {
      default_facts.merge({
        :operatingsystemmajrelease => '7'
      })
    }

    let(:pre_condition) { 'class {"kibana": install_path => "/usr/local" }' }

    it { should contain_exec('extract_kibana').with(:command => 'tar -xzf /tmp/kibana-4.0.1-linux-x64.tar.gz -C /usr/local' ) }
    it { should contain_file('/usr/local/kibana').with(:target => '/usr/local/kibana-4.0.1-linux-x64') }

  end

  context 'with a different user and group' do

    let (:facts) {
      default_facts.merge({
        :operatingsystemmajrelease => '7'
      })
    }

    let (:params) {
      {
        :group        => 'test_group',
        :user         => 'test_user',
        :install_path => '/opt',
        :version      => '4.0.1'
      }
    }

    it { should contain_user('test_user') }
    it { should contain_exec('ensure_correct_permissions').with(:command => 'chown -R test_user:test_group /opt/kibana-4.0.1-linux-x64', :require => ["Exec[extract_kibana]","User[test_user]"]) }
  end

  context 'when running on EL 7' do

    let (:facts) {
      default_facts.merge({
        :operatingsystemmajrelease => '7'
      })
    }

    let(:pre_condition) { 'include kibana'}

    it { should contain_file('kibana-init-script').with(:path => '/usr/lib/systemd/system/kibana.service', :content => /ExecStart=\/opt\/kibana\/bin\/kibana/) }

  end

  context 'when running on EL 6' do

    let (:facts) {
      default_facts.merge({
        :operatingsystemmajrelease => '6'
      })
    }

    let(:pre_condition) { 'include kibana'}

    it { should contain_file('kibana-init-script').with(:path => '/etc/init.d/kibana', :content => /KIBANA_HOME="\/opt\/kibana"/) }

  end

  context 'EL 7 with a different install_path' do

    let (:facts) {
      default_facts.merge({
        :operatingsystemmajrelease => '7'
      })
    }

    let(:pre_condition) { 'class {"kibana": install_path => "/usr/local" }' }

    it { should contain_file('kibana-init-script').with(:path => '/usr/lib/systemd/system/kibana.service', :content => /ExecStart=\/usr\/local\/kibana\/bin\/kibana/) }

  end

  context 'EL 6 with a different install_path' do

    let (:facts) {
      default_facts.merge({
        :operatingsystemmajrelease => '6'
      })
    }

    let(:pre_condition) { 'class {"kibana": install_path => "/usr/local" }' }

    it { should contain_file('kibana-init-script').with(:path => '/etc/init.d/kibana', :content => /KIBANA_HOME="\/usr\/local\/kibana"/) }

  end

  context 'when running on i386' do
    let (:facts) {
      default_facts.merge({
        :architecture => 'i386'
      })
    }

    let(:pre_condition) { 'include kibana'}

    it { should contain_wget__fetch('kibana').with(
      :source => 'https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x86.tar.gz',
      :destination => '/tmp/kibana-4.0.1-linux-x86.tar.gz'
      ) }
    it { should contain_exec('extract_kibana').with(:command => 'tar -xzf /tmp/kibana-4.0.1-linux-x86.tar.gz -C /opt' ) }
    it { should contain_file('/opt/kibana').with(:target => '/opt/kibana-4.0.1-linux-x86') }
  end

  context 'when running on x86_64' do
    let (:facts) {
      default_facts.merge({
        :architecture => 'x86_64'
      })
    }

    let(:pre_condition) { 'include kibana'}

    it { should contain_wget__fetch('kibana').with(
      :source => 'https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz',
      :destination => '/tmp/kibana-4.0.1-linux-x64.tar.gz'
      ) }
    it { should contain_exec('extract_kibana').with(:command => 'tar -xzf /tmp/kibana-4.0.1-linux-x64.tar.gz -C /opt' ) }
    it { should contain_file('/opt/kibana').with(:target => '/opt/kibana-4.0.1-linux-x64') }
  end

  context 'when running on Debian' do
    let (:facts) {
      default_facts.merge({
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :operatingsystemmajrelease => '7',
      })
    }

    let(:pre_condition) { 'include kibana' }

    it { should contain_file('kibana-init-script').with(:path => '/etc/init.d/kibana', :content => /\/lib\/lsb\/init-functions/) }
  end

  context 'ensure init script is POSIX compatible' do
    let (:facts) {
      default_facts.merge({
        :operatingsystem => 'Debian',
      })
    }

    let (:pre_condition) { 'include kibana' }

    it { should contain_file('kibana-init-script').without_content(/==/) }
  end

end

