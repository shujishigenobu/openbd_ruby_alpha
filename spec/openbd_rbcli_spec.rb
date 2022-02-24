require_relative '../openbd_rbcli.rb'
require 'json'

RSpec.describe 'Test CLI' do
  it 'shows help' do
    cmd = "ruby openbd_rbcli.rb"
    system cmd
    STDERR.puts cmd
  end

  it 'get command' do
    query = '9784296109654'
    cmd = "ruby openbd_rbcli.rb get #{query} "
    res = IO.popen(cmd){|io| io.read}
    h = JSON.parse(res)
    p h
    p h[0]['isbn']
    expect(h[0]['isbn']).to eq query
  end

end