require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylist)
end

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end

post("/clients") do
  name = params.fetch("name")
  client = Client.new({:name => name, :id => nil})
  client.save()
  @clients = Client.all()
  erb(:client)
end
