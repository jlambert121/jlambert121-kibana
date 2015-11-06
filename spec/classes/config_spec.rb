require 'spec_helper'

describe 'kibana::config', :type => :class do

  let(:facts) { {
    :kernel => 'Linux',
    :http_proxy => false,
    :https_proxy => false,
  } }

  let(:params) { {
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
  } }

  it { should contain_file('/opt/kibana/config/kibana.yml') }

end
