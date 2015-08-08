require 'sinatra'

shorted = Hash.new

get '/:short' do |short|
  if shorted.has_key?(short)
    redirect shorted[short]
  else
    "Sorry, not in our Database!"
  end
end

get '/' do
  File.read(File.join("public", "index.html"))
end

post '/create-short' do
  hashed = Digest::MD5.hexdigest(params[:longurl])[0,9]
  shorted[hashed] = params[:longurl]
  "The shortned version is: #{hashed}"
end