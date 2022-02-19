require 'open-uri'
require 'json'

baseurl = "https://api.openbd.jp/v1"

query = ARGV[0]
q = query.strip
raise unless /^\d+$/.match(q)

mode = (ARGV[1] || "summary") # summary or full

url = nil
url = baseurl + "/get?isbn=#{q}"

uri = URI.parse(url)
# STDERR.puts uri

res = uri.open.read

data = JSON.parse(res) #data : Array
if mode == 'summary'
  puts  data.map{|e| e["summary"]}.to_json
else
  puts res
end
