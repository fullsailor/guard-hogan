require 'guard'
require 'guard/guard'

module ::Guard
  class Hogan < ::Guard::Guard

    autoload :Runner, 'guard/hogan/runner'
    autoload :Compiler, 'guard/hogan/compiler'

    def initialize(watchers=[], options={})
      if options[:input]
        watchers << ::Guard::Watcher.new(/^#{ options[:input] }\/(.+)\.mustache$/)
      end
      @runner = Runner.new(options)
      super(watchers, options)
    end

    def start
      run_all
    end

    def run_all
      @runner.run(Watcher.match_files(self, Dir.glob('**{,/*/**}/*.mustache')))
    end

    def run_on_change(paths)
      run_all 
    end
  end
end
