require ::File.expand_path('../config/client_event',  __FILE__)
require ::File.expand_path('../config/environment',  __FILE__)
require 'faye'


# Load a WebSocket adapter for whichever server you're using
Faye::WebSocket.load_adapter 'thin'

use Faye::RackAdapter, :mount => 'http://ancient-lowlands-4557.herokuapp.com/faye', :timeout => 25 do |faye|
  faye.add_extension(ClientEvent.new)
end

run Rails.application 