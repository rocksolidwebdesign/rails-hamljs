require 'rails-hamljs/version'
require 'tilt'
require 'sprockets'

module Hamljs
  class Template < Tilt::Template
    JS_UNESCAPES = {
      '\\' => '\\',
      "'" => "'",
      'r' => "\r",
      'n' => "\n",
      't' => "\t",
      'u2028' => "\u2028",
      'u2029' => "\u2029"
    }
    JS_ESCAPES = JS_UNESCAPES.invert
    JS_UNESCAPE_PATTERN = /\\(#{Regexp.union(JS_UNESCAPES.keys)})/
    JS_ESCAPE_PATTERN = Regexp.union(JS_ESCAPES.keys)

    def self.engine_initialized?
      true
    end

    def initialize_engine
    end

    def prepare
    end

    def compile(source, options = {})
      source = source.dup

      js_escape!(source)

      context = ExecJS.compile(File.read(File.expand_path("../../vendor/assets/javascripts/haml.js", __FILE__)))
      context.eval("Haml('#{source}').toString()");
    end

    def evaluate(scope, locals, &block)
      source = data.dup
      return compile(source)
    end

  protected
    def js_escape!(source)
      source.gsub!(JS_ESCAPE_PATTERN) { |match| '\\' + JS_ESCAPES[match] }
      source
    end
  end

end

Sprockets.register_engine '.haml', Hamljs::Template
