require 'spec_helper'

describe 'kibana::dashboard', :type => :define do

  context 'valid name' do
    let(:title) { 'mydash.json' }
    let(:params) { { :source => 'puppet:///somewhere' } }

    it { should contain_file('/var/www/html/kibana/dashboards/mydash.json') }
  end

  context 'invalid name' do
    let(:title) { 'mydash' }
    let(:params) { { :source => 'puppet///somewhere' } }

    it { expect { should raise_error(Puppet::Error) } }
  end

end

