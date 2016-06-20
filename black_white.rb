class BlackWhite < Sinatra::Application
  set :database, 'sqlite://black_white.db'

  migration "create the choices table" do
    database.create_table :choices do
      primary_key :id
      String :choice
    end
  end

  class Choice < Sequel::Model
  end


  get "/" do
    choice = Choice.first
    if choice
      redirect "/#{choice.choice}"
    else
      erb :index
    end
  end

  get "/black" do
    choice = Choice.first
    if choice && choice.choice != 'black'
      redirect "/#{choice.choice}"
    else
      Choice.create(choice: 'black')
      erb :black
    end
  end

  get "/white" do
    choice = Choice.first
    if choice && choice.choice != 'white'
      redirect "/#{choice.choice}"
    else
      Choice.create(choice: 'white')
      erb :white
    end
  end
end
