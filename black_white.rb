class BlackWhite < Sinatra::Application
  CHOICE_FILE = "choice.txt"
  get "/" do
    if File.exists?(CHOICE_FILE)
      choice = File.read(CHOICE_FILE).chomp
      redirect "/#{choice}"
    else
      erb :index
    end
  end

  get "/black" do
    if File.exists?(CHOICE_FILE)
      choice = File.read(CHOICE_FILE).chomp
      if choice == 'black'
          erb :black
      else
        redirect choice
      end
    else
      File.open(CHOICE_FILE, "w+") { |f| f << 'black' }
      erb :black
    end
  end

  get "/white" do
    if File.exists?(CHOICE_FILE)
      choice = File.read(CHOICE_FILE).chomp
      if choice == 'white'
        erb :white
      else
        redirect choice
      end
    else
      File.open(CHOICE_FILE, "w+") { |f| f << 'white' }
      erb :white
    end
  end
end
