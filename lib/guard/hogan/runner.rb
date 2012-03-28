require 'json'
module Guard
  class Hogan < ::Guard::Guard
    class Runner

      def initialize(options)
        @options = options
      end

      def run(paths=[])
        templates = paths.collect { |path| compile(path) }    
        write_templates_file(templates, paths)
      end

      private 

      def write_templates_file(templates, paths)
        names = paths.collect { |path| File.basename(path, '.mustache') }
        templates = Hash[names.zip(templates)]
        filename = File.expand_path(@options[:output])
        FileUtils.mkdir_p(File.dirname(filename))
        File.open(File.expand_path(filename), 'w') do |f| 
          f.write(<<JAVASCRIPT
(function(root, Hogan){
  root.hoganTemplates = #{templates.to_json}
  for (var key in root.hoganTemplates) {
    root.hoganTemplates[key] = 
      new Hogan.Template(root.hoganTemplates[key])
  }
})(window,window.Hogan)
JAVASCRIPT
          )
        end

        filename
      end

      def compile(file)
        Compiler.compile(File.read(file))
      end
    end
  end
end
