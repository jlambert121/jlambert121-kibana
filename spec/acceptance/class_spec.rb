require 'spec_helper_acceptance'

describe 'kibana classes' do
  context 'pre-config for kibana' do
    it 'should set up elasticsearch' do
      pp = <<-EOS
      class { 'java': }
      class {'elasticsearch':
        manage_repo  => true,
        repo_version => 1.4,
      }
      elasticsearch::instance { 'es-01': }
      EOS

      apply_manifest(pp, :catch_failures => true)
    end
  end

  context 'install/configure' do
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'kibana': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe service('kibana') do
      it { should be_running }
      it { should be_enabled }
    end

    describe port(5601) do
      it { should be_listening.with('tcp') }
    end

  end # install/config

end
