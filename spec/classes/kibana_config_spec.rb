require 'spec_helper'

describe 'kibana::config', :type => :class do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat' } }

  context 'default config' do
    let(:params) { {
      :es_host => '',
      :es_port => '9200',
      :modules => ['histogram','map']
    } }

    it { should contain_file('/var/www/html/kibana/config.js').with_content(/^\s+elasticsearch:\s+'http:\/\/'\+window.location.hostname\+':9200',$/) }
    it { should contain_file('/var/www/html/kibana/config.js').with_content(/^\s+modules:\s+\['histogram','map'\]/) }

    it { should contain_apache__vhost('kibana') }
  end

  context 'set es host and port' do
    let(:params) { {
      :es_host => 'elasticsearch',
      :es_port => '9300',
      :modules => ['histogram','map']
    } }

    it { should contain_file('/var/www/html/kibana/config.js').with_content(/^\s+elasticsearch:\s+'http:\/\/elasticsearch:9300',$/) }

  end

end
