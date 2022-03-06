require_relative '../openbd_rbcli.rb'
require 'json'

RSpec.describe 'Test CLI' do
  # it 'shows help' do
  #   cmd = "ruby openbd_rbcli.rb"
  #   res = IO.popen(cmd){|io| io.read}
  #   STDERR.puts cmd
  #end

  it 'get command' do
    query = '9784296109654'
    cmd = "ruby openbd_rbcli.rb get #{query} "
    res = IO.popen(cmd){|io| io.read}
    h = JSON.parse(res)
    p h
    p h[0]['isbn']
    expect(h[0]['isbn']).to eq query
  end

  it 'mget command' do
    query1 = '9784296109654'
    query2 = '9784478112137'
    query = [query1, query2].join(',')
    cmd = "ruby openbd_rbcli.rb mget #{query} "
    res = IO.popen(cmd){|io| io.read}
    data = JSON.parse(res)
    p data
    p data.map{|d| d['isbn']}
    p [query1, query2]
    expect(data.map{|d| d['isbn']}).to eq [query1, query2]
  end

end