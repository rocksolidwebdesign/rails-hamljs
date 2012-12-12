require 'rails-hamljs/version'
require 'tilt'
require 'sprockets'
require 'open-uri'

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

    JS_ESCAPES          = JS_UNESCAPES.invert
    JS_UNESCAPE_PATTERN = /\\(#{Regexp.union(JS_UNESCAPES.keys)})/
    JS_ESCAPE_PATTERN   = Regexp.union(JS_ESCAPES.keys)

    def self.engine_initialized?
      true
    end

    def initialize_engine
    end

    def prepare
    end

    def get_coffeescript_source
      @@coffeescript_source ||= open('http://jashkenas.github.com/coffee-script/extras/coffee-script.js').read
    end

    def get_underscore_source
      #@@underscore_source ||= open('http://underscorejs.org/underscore-min.js').read
      @@underscore_source ||= File.read(File.expand_path("../../vendor/assets/javascripts/uglyog-haml-js/ext/underscore.js", __FILE__))
    end

    def get_underscore_string_source
      #@@underscore_string_source ||= open('http://epeli.github.com/underscore.string/dist/underscore.string.min.js').read
      @@underscore_string_source ||= File.read(File.expand_path("../../vendor/assets/javascripts/uglyog-haml-js/ext/underscore.string.js", __FILE__))
    end

    def get_hamljs_source
      @@hamljs_source ||= get_uglyog_hamljs_source
    end

    def get_jsonjs_source
      @@jsonjs_source ||= File.read(File.expand_path("../../vendor/assets/javascripts/uglyog-haml-js/ext/json2.js", __FILE__))
    end

    def get_creationix_hamljs_source
      @@creationix_hamljs_source ||= File.read(File.expand_path("../../vendor/assets/javascripts/creationix-haml-js/haml.js", __FILE__))
    end

    def get_uglyog_hamljs_source
      @@uglyog_hamljs_source ||= [
        get_jsonjs_source,
        get_underscore_source,
        get_underscore_string_source,
        File.read(File.expand_path("../../vendor/assets/javascripts/uglyog-haml-js/haml.min.js", __FILE__))
        #open('https://raw.github.com/uglyog/clientside-haml-js/master/lib/haml.min.js').read
      ].join(" ")

      #@@uglyog_hamljs_source ||= File.read(File.expand_path("../../vendor/assets/javascripts/uglyog-haml-js/haml.min.js", __FILE__))
    end

    def compile(source, options = {})
      s = source.dup

      cmd = "haml.compileHaml({source: \"#{js_escape!(s)}\", generator: 'coffeescript'}).toString()"

      lib_sources = [
        get_coffeescript_source,
        get_hamljs_source
      ]

      context = ExecJS.compile(lib_sources.join(" "))
      result = context.eval(cmd)

      result
    end

    def evaluate(scope, locals, &block)
      source = data.dup
      return compile(source)
    end

  protected
    def js_escape!(source)
      puts "JS_ESCAPE_PATTERN: #{}"
      puts JS_ESCAPE_PATTERN.inspect
      puts "JS_ESCAPES:"
      puts JS_ESCAPES.inspect
      source.gsub!(/\n/, '\n')
      source.gsub!(/\r/, '\r')
      source.gsub!(/\t/, '\t')
      source.gsub!(/"/, '\"')
      source.gsub!(/\u2028/, '\u2028')
      source.gsub!(/\u2029/, '\u2029')
      source
    end
  end

end

Sprockets.register_engine '.hamljs', Hamljs::Template
