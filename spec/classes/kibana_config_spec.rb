require 'spec_helper'

describe 'kibana::config', :type => :class do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat' } }

  context 'default config' do
    it { should contain_file('/var/www/html/kibana/config.js').with_content(/^\s+elasticsearch:\s+'http:\/\/'\+window.location.hostname\+':9200',$/) }
    it { should contain_apache__vhost('kibana') }
    it { should_not contain_file('/var/www/html/kibana/dashboards/default.json') }
  end

  context 'set es host and port' do
    let(:params) { {
      :es_host  => 'elasticsearch',
      :es_port  => '9300',
    } }

    it { should contain_file('/var/www/html/kibana/config.js').with_content(/^\s+elasticsearch:\s+'http:\/\/elasticsearch:9300',$/) }
  end

  context 'set default board' do
    let(:params) { { :default_board => 'logstash.json' } }

    it { should contain_file('/var/www/html/kibana/dashboards/default.json').with(
      :ensure => 'link',
      :target => '/var/www/html/kibana/dashboards/logstash.json'
    )}
  end

end
