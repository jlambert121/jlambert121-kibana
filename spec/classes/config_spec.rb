require 'spec_helper'

describe 'kibana::config', :type => :class do

  let(:facts) { {
    :kernel => 'Linux',
    :http_proxy => false,
    :https_proxy => false,
  } }

  default_params = {
    :port                   => 5601,
    :bind                   => '0.0.0.0',
    :ca_cert                => nil,
    :es_url                 => 'http://localhost:9200',
    :es_preserve_host       => true,
    :kibana_index           => '.kibana',
    :elasticsearch_username => nil,
    :elasticsearch_password => nil,
    :default_app_id         => 'discover',
    :pid_file               => '/var/run/kibana.pid',
    :request_timeout        => 30000,
    :shard_timeout          => 0,
    :ssl_cert_file          => nil,
    :ssl_key_file           => nil,
    :verify_ssl             => true,
    :install_path           => '/opt'
  }

  context 'with version 4.1 or lower' do

    let(:params) {
      default_params.merge({
        :version  => '4.1.5'
      })
    }

    it { should contain_file('/opt/kibana/config/kibana.yml').with_content(/^port:/) }

  end

  context 'with version 4.2' do

    let(:params) {
      default_params.merge({
        :version  => '4.2.0'
      })
    }

    it { should contain_file('/opt/kibana/config/kibana.yml').with_content(/^server\.port:/) }
    it { should contain_file('/opt/kibana/config/kibana.yml').without_content(/^port:/)}

  end

  context 'with version 4.1 and a basePath which is supported since 4.2' do

    let(:params) {
      default_params.merge({
        :version   => '4.1.5',
        :base_path => '/kibana'
      })
    }

    it { should compile.and_raise_error(/Kibana config: server.basePath is not supported for kibana 4.1 and lower/) }

  end


end
