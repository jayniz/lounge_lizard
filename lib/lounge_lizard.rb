require 'lounge_lizard/version'
require 'ffi'
require 'json'
require 'lounge_lizard/binding'

# Convenience methods, so you don't have to access the bindings directly
module LoungeLizard
  def self.parse(mson)
    parse_result = FFI::MemoryPointer.new :pointer
    Binding.drafter_parse_blueprint_to(mson, parse_result, Binding::DrafterOptions.as_json)
    parse_result = parse_result.get_pointer(0)
    result_string = parse_result.read_string unless parse_result.null?
    return {} if result_string.to_s.empty?
    JSON.parse(result_string)
  ensure
    parse_result.free
  end
end
