require 'vcr'

VCR.configure do |c|
  vcr_mode = :once
  c.cassette_library_dir = 'spec/cassettes'
  c.configure_rspec_metadata!
  c.hook_into :webmock
end
