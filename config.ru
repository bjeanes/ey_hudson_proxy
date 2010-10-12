require 'rubygems'
require 'bundler'
Bundler.require

hudson_port = 8082

use Rack::StreamingProxy do |request|
  "http://localhost:#{hudson_port}#{request.path}"
end

run lambda {}