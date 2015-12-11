require 'spec_helper'

describe 'kibana::plugin', :type => :define do

  context 'Add a plugin' do
    let(:title) { 'marvel' }
    let(:params) { { :source => 'elasticsearch/marvel/latest' }}
  
    let (:facts) { {
      :operatingsystem => 'CentOS',
      :kernel => 'Linux',
      :osfamily => 'RedHat',
      :operatingsystemmajrelease => '7',
      :http_proxy => false,
      :https_proxy => false,
      :architecture => 'amd64'
    } }
  
    it { should contain_kibana__plugin('marvel')}
  end

  context 'Remove a plugin' do
    let(:title) { 'marvel' }
    let(:params) do { 
      :source => 'elasticsearch/marvel/latest', 
      :ensure => 'absent' 
    } end
  
    let (:facts) { {
      :operatingsystem => 'CentOS',
      :kernel => 'Linux',
      :osfamily => 'RedHat',
      :operatingsystemmajrelease => '7',
      :http_proxy => false,
      :https_proxy => false,
      :architecture => 'amd64'
    } }
  
    it { should contain_kibana__plugin('marvel').with(:ensure => 'absent') }
  end
end
