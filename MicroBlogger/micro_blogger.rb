require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
	end

  def tweet(message)
    if message.length <=140
      @client.update(message)
    else
      puts "Warning message is to long"
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
    message = "d @#{target} #{message}"
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if screen_names.include? target
      tweet(message)
    else
      puts "You can only DM people who follow you"
    end
  end

  def follower_list
    screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    screen_names
  end

  def spam_my_followers(message)
    followers = follower_list
    followers.each do |follower|
      dm(follower, message)
    end
  end

  def everyones_last_tweet
    friends = @client.friends
    friends.sort_by {|friend| @client.user(friend).screen_name.downcase}
    friends.each do |friend|
      friend = @client.user(friend).screen_name
      last_message = @client.user(friend).status.text
      timestamp = @client.user(friend).status.created_at
      puts "#{friend}: #{last_message}"
      print timestamp.strftime("%A, %b %d")
      puts ""
    end
  end

  def shorten(original_url)
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    original_url = bitly.shorten(original_url).short_url
    puts "Shortening this URL: #{original_url}"
    original_url
  end

  def run
    puts "Welcome to the JSL Twitter Client"
    command = ""
    while command != "q"
      printf "enter command: "
      command = gets.chomp
      parts = command.split(" ")
      command = parts[0]
      case command 
      when 'q' then puts "Goodbye!"
      when 't' then tweet(parts[1..-1].join(" "))
      when 'dm' then dm(parts[1], parts[2..-1].join(" "))
      when 'spam' then spam_my_followers(parts[1..-1].join(" "))
      when 'elt' then everyones_last_tweet
      when 's' then shorten(parts[1..-1].join(" "))
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end

  blogger = MicroBlogger.new
  blogger.run
end