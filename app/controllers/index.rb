get '/' do

  erb :index
end

post '/' do
  markov
end
