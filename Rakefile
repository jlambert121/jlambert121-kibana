require 'bundler/setup'
require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'
require 'metadata-json-lint/rake_task'
require 'parallel_tests'
require 'parallel_tests/cli'

begin
  require 'puppet_blacksmith/rake_tasks'
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

begin
  require 'rubocop/rake_task'
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

exclude_paths = [
  "bundle/**/*",
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]

Rake::Task[:coverage].clear
Rake::Task[:lint].clear

PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.send('relative')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc "Run acceptance tests"
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc "Populate CONTRIBUTORS file"
task :contributors do
  system("git log --format='%aN' | sort -u > CONTRIBUTORS")
end

RuboCop::RakeTask.new

desc "Parallel spec tests"
  task :parallel_spec do
  matched_files = FileList['spec/**/*_spec.rb'].exclude(/fixtures|acceptance/)
  cli_args = ['-t', 'rspec']
  cli_args.concat(matched_files)

  Rake::Task[:spec_prep].invoke
  ParallelTests::CLI.new.run(cli_args)
  Rake::Task[:spec_clean].invoke
end

desc "Run syntax, lint, and spec tests."
task :test => [:metadata_lint, :syntax, :lint, :rubocop, :parallel_spec]
