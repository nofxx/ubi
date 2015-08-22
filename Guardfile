#
# Ubi Guard
#
guard :rubocop, all_on_start: false, keep_failed: false, cli: ['-D'] do
  watch(/.+\.rb$/)
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end

guard :rspec, cmd: 'bundle exec rspec' do
  watch(/^spec\/.+_spec\.rb$/)
  watch(/^lib\/(.+)\.rb$/)     { |m| "spec/#{m[1]}_spec.rb" }
  watch(/^generators\/(.+)\.rb$/) { |_m| 'spec/schemaless/worker_spec' }

  watch('lib/ubi.rb') { 'spec' }
  watch('spec/spec_helper.rb') { 'spec' }
end
