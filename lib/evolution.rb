require "evolution/version"

module Evolution
  class Repo
    def initialize(options = {})
      @path = options[:path] || Dir.pwd
      @results = {}
      @before = options[:before]
      @after = options[:after] || (Date.today << 6).strftime('%Y-%m-%d')
    end

    def run
      files = []

      Dir.chdir(@path) do
        files = `git log --after #{@after} --name-only --format='%n'`.split(/\n/).reject{|line| line == ""}
      end

      results = {}

      files.each do |file|
        # TODO This is not optimal
        results[file] = files.count(file)
      end

      @results = results.sort_by{|r| r[1]}.reverse
    end

    def report
      max_file_length = @results.map{|r| r[0].length}.max

      puts "+---------------+#{'-' * max_file_length}---+"
      puts "| Times Changed | File path #{' ' * (max_file_length - 8) }+"
      puts "+---------------+#{'-' * max_file_length}---+"
      @results.each do |result|
        puts "| #{result[1]}#{" " * (13 - result[1].to_s.length)} | #{result[0]}#{" " * (max_file_length - result[0].to_s.length + 2)}|"
      end
      puts "+---------------+#{'-' * max_file_length}---+"
      nil
    end
  end
end
