lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ffi/base32/version"

Gem::Specification.new do |spec|
  spec.name          = "ffi-base32"
  spec.version       = ::FFI::Base32::VERSION
  spec.authors       = ["Marcos Minond"]
  spec.email         = ["minond.marcos+rubygems@gmail.com"]

  spec.summary       = %q{Ruby FFI bindings for base32 encoding and decoding.}
  spec.description   = %q{Ruby FFI bindings for base32 encoding and decoding.}
  spec.homepage      = "https://github.com/minond/ffi-base32"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  # spec.bindir        = "exe"
  # spec.extensions    = "ext/ffi/base32/Rakefile"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
