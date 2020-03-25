require 'echo'
require 'stringio'

describe Echo do

  subject(:app) { Echo.new }

  describe '.welcome' do
    it 'prompts the user for a message' do
      expect { app.welcome }.to output("Say something:\n").to_stdout
    end
  end

  describe '.close' do
    it 'says goodbye' do
      expect { app.close }.to output("Goodbye!\n").to_stdout
    end
  end

  describe '.user_input' do
    it 'shows the date, time and inputted message' do
      io = StringIO.new
      $stdin = io
      allow($stdin).to receive(:gets) { "hello, world\n" }
      allow(Time).to receive(:now) { Time.new(2018, 1, 9, 16, 26, 2) }
      expect { app.user_input }.to output("2018-01-09 | 16:26 | You said: 'hello, world'!\n").to_stdout
    end
  end

end

describe 'Feature test echo app' do

  subject(:app) { Echo.new }

  it 'runs a short round of echo' do
    io = StringIO.new
    $stdin = io
    allow($stdin).to receive(:gets) { "exit\n" }
    expect { app.echo }.to output("Say something:\nGoodbye!\n").to_stdout
  end

  it 'runs a longer round of echo' do
    io = StringIO.new
    $stdin = io

    allow($stdin).to receive(:gets) { "hello, world\n" }
    allow(Time).to receive(:now) { Time.new(2018, 1, 9, 16, 26, 2) }

    # allow($stdin).to receive(:gets) { "Yeesss, sister\n" }
    # allow(Time).to receive(:now) { Time.new(2018, 1, 9, 16, 35, 2) }
    #
    # allow($stdin).to receive(:gets) { "exit\n" }

    expect { app.echo }.to output("Say something:\n2018-01-09 | 16:26 | You said: 'hello, world'!\nSay something:\n2018-01-09 | 16:35 | You said: 'Yeesss, sister'!\nGoodbye!\n").to_stdout
  end

end
