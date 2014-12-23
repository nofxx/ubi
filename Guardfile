#
# Ubi Guard
#
guard :rubocop, all_on_start: false, keep_failed: false, cli: ['-D'] do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(/^generators\/(.+)\.rb$/) { |_m| 'spec/schemaless/worker_spec' }

  watch('spec/spec_helper.rb')  { 'spec' }
end
