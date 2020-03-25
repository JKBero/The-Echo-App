class Echo

  def echo
    welcome
    input = user_input
    while input != 'exit'
      welcome
      input = user_input
    end
    close
  end

  def welcome
    puts "Say something:"
  end

  def user_input
    input = gets.chomp
    today = Time.now
    date = today.strftime('%F')
    time = today.strftime('%H:%M')
    if input != 'exit'
      puts "#{date} | #{time} | You said: '#{input}'!"
    end
    input
  end

  def close
    puts "Goodbye!"
  end

end

app = Echo.new
app.echo
