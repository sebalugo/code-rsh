require 'hashie'
require 'securerandom'


class ClientEvent
  MONITORED_CHANNELS = [ '/lobby/ruby', '/lobby/js' , '/lobby/java' , '/lobby/python'  ]

  def incoming(message, callback)
    return callback.call(message) unless MONITORED_CHANNELS.include? message['subscription']

    lobby_channel = message['subscription']

    faye_msg = Hashie::Mash.new(message)
    faye_action = faye_msg.channel.split('/').last

    if name = get_client(lobby_channel)
      faye_client.publish(lobby_channel, build_hash(lobby_channel))
    end
    callback.call(message)
  end

  def get_client(lobby_channel)
    if lobby_channel == '/lobby/ruby'
      cnt_ruby.push(1)
    elsif lobby_channel == '/lobby/js'
      cnt_js.push(1)
    elsif lobby_channel == '/lobby/java'
      cnt_java.push(1)
    elsif lobby_channel == '/lobby/python'
      cnt_python.push(1)
    end
  end

  def cnt_ruby
    @cnt_ruby ||= []
  end

  def cnt_js
    @cnt_js ||= []
  end

  def cnt_java
    @cnt_java ||= []
  end

  def cnt_python
    @cnt_python ||= []
  end

  def faye_client
    @faye_client ||= Faye::Client.new('ancient-lowlands-4557.herokuapp.com/faye')
  end

  def build_hash(lobby_channel)
    message_hash = {}

    if cnt_ruby.length == 2 and lobby_channel == "/lobby/ruby"
      message_hash['message'] = { 'content' => "Match ready to start!" , 'key' => "#{SecureRandom.hex}" , 'course' => "#{1+rand(3)}" ,'category' =>"ruby"}
      cnt_ruby.delete_at(0)
      cnt_ruby.delete_at(0)
    elsif lobby_channel == "/lobby/ruby"
      message_hash['message'] = { 'content' => "#{cnt_ruby.length}" }
    end

    if cnt_js.length == 2 and lobby_channel == "/lobby/js"
      message_hash['message'] = { 'content' => "Match ready to start!"}
      cnt_js.delete_at(0)
      cnt_js.delete_at(0)
    elsif lobby_channel == "/lobby/js"
      message_hash['message'] = { 'content' => "#{cnt_js.length}" }
    end

    if cnt_java.length == 2 and lobby_channel == "/lobby/java"
      message_hash['message'] = { 'content' => "Match ready to start!"}
      cnt_java.delete_at(0)
      cnt_java.delete_at(0)
    elsif lobby_channel == "/lobby/java"
      message_hash['message'] = { 'content' => "#{cnt_java.length}" }
    end

    if cnt_python.length == 2 and lobby_channel == "/lobby/python"
      message_hash['message'] = { 'content' => "Match ready to start!"}
      cnt_python.delete_at(0)
      cnt_python.delete_at(0)
    elsif lobby_channel == "/lobby/python"
      message_hash['message'] = { 'content' => "#{cnt_python.length}" }
    end

    message_hash
  end
end
