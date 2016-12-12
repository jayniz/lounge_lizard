module LoungeLizard
  module Binding
    extend FFI::Library

    prefix = FFI::Platform.mac? ? '' : 'lib.target/'

    enum :drafter_format, [:DRAFTER_SERIALIZE_YAML, :DRAFTER_SERIALIZE_JSON]

    ffi_lib File.expand_path("../../../ext/drafter/build/out/Release/#{prefix}libdrafter.#{FFI::Platform::LIBSUFFIX}", __FILE__)

    class DrafterOptions < FFI::Struct
      layout :sourcemap, :bool,
             :format, :drafter_format

      def self.as_json
        DrafterOptions.new.tap do |drafter_options_struct|
          # serialize as json(1), as the default is yaml(0)
          drafter_options_struct[:format] = 1
          drafter_options_struct[:sourcemap] = false
        end
      end
    end

    #  Attached function:
    #  https://github.com/apiaryio/drafter/blob/0f485b647e71780659d1d4e42c402d60a9dd1507/src/drafter.cc
    #  DRAFTER_API int drafter_parse_blueprint_to(const char* source, char **out, const drafter_options options)
    attach_function :drafter_parse_blueprint_to, [:string, :pointer, DrafterOptions.by_value], :int
  end
end
