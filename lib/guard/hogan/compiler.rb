# Based on https://github.com/leshill/hogan_assets
require 'execjs'
require 'pathname'

module Guard
  class Hogan < ::Guard::Guard
    class Compiler
      class BareString < ::String
        def to_json(*)
          self
        end
      end
      class << self
        def compile(source)
          template = context.eval("Hogan.compile(#{source.inspect}, {asString: true})")
          BareString.new(template)
        end

        private

        def context
          @context ||= ExecJS.compile(hogan)
        end

        def hogan
          @hogan ||= path.read
        end

        def path
          @path ||= Pathname(__FILE__).dirname.join('..','..','..','vendor','hogan.js')
        end

      end
    end
  end
end
