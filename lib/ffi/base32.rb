require "ffi"

module FFI
  module Base32
    extend FFI::Library

    ffi_lib "vendor/libbase32.#{::FFI::Platform::LIBSUFFIX}"

    def self.bind(label)
      attach_function :"_#{label}_encode", :"#{label}_encode", [:buffer_in, :buffer_out], :string
      attach_function :"_#{label}_decode", :"#{label}_decode", [:buffer_in, :buffer_out], :string

      define_singleton_method :"#{label}_encode" do |text| self.send :"_#{label}_encode", text, "" end
      define_singleton_method :"#{label}_decode" do |text| self.send :"_#{label}_decode", text, "" end
    end

    bind :crockford
    bind :nintendo
    bind :rfc4648
    bind :triacontakia
    bind :zbase32
  end
end
