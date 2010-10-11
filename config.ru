require 'rubygems'
require 'bundler'
Bundler.require

hudson_port = 8082

class Dummy
  def call(env)
    [200, {"Content-Type" => "text/plain"}, ["You should never see this!"]]
  end
end

use Rack::StreamingProxy do |request|
  "http://localhost:#{hudson_port}#{request.path}"
end

run Dummy