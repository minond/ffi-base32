require "minitest/autorun"

require "./lib/ffi/base32"

class ::FFI::Base32::Test < Minitest::Test
  def self.suite(algo)
    define_method :"test_#{algo}_encode_decode_match" do
      assert_encode_decode_equal algo, ""
      assert_encode_decode_equal algo, "123"
      assert_encode_decode_equal algo, "fjkdlsfjkdl"
    end
  end

  def assert_encode_decode_equal(algo, str)
    encoded = ::FFI::Base32.send :"#{algo}_encode", str
    decoded = ::FFI::Base32.send :"#{algo}_decode", encoded
    assert_equal str, decoded
  end

  suite :crockford
  suite :nintendo
  suite :rfc4648
  suite :triacontakia
  suite :zbase32
end
