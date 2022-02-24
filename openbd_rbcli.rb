#!/usr/bin/env ruby

require 'open-uri'
require 'json'
require 'thor'

module OpenBd

  BASE_API_URL = "https://api.openbd.jp/v1"

  class CLI < Thor

    ## hack to enable -h option
    ## ref: https://magazine.rubyist.net/articles/0046/0046-Milkode.html#%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA-milk-add--h-%E3%82%92%E5%AE%9F%E7%8F%BE%E3%81%99%E3%82%8B

    class_option :help, :type => :boolean, :aliases => '-h', :desc => 'Help message'
    
    no_tasks do
      def invoke_command(task, *args)
        if options[:help]
          OpenBd::CLI.task_help(shell, task.name)
        else
          super
        end
      end
    end
    ## end of -h option setting
    
    desc "get ISBN", "retrieve book information by ISBN."
    option :mode, :aliases => '-m', :enum => ["summary", "full"], :default => "summary", :desc => "output mode"
    def get(query)
      q = query.strip
      raise unless /^\d+$/.match(q)
      mode = options[:mode]

      url = nil
      url = BASE_API_URL + "/get?isbn=#{q}"

      uri = URI.parse(url)
      STDERR.puts uri

      res = uri.open.read

      data = JSON.parse(res) #data : Array
      if mode == 'summary'
        puts  data.map{|e| e["summary"]}.to_json
      else 
        puts res
      end
    end

  end

end

if __FILE__ == $0
  OpenBd::CLI.start(ARGV)
end