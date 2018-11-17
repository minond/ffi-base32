require "ffi"

module FFI
  module Base32
    extend FFI::Library

    ffi_lib "vendor/libbase32.dylib"

    attach_function :_zbase32_encode, :zbase32_encode, [:string, :string], :string
    attach_function :_zbase32_decode, :zbase32_decode, [:string, :string], :string

    def self.zbase32_encode(text)
      _zbase32_encode text, ""
    end

    def self.zbase32_decode(text)
      _zbase32_decode text, ""
    end
  end
end
