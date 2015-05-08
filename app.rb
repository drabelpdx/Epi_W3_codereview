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

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end

get("/stylists/:id") do
  @clients = Client.all()
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylists = Stylist.all()
  erb(:stylist)
end

get("/clients/:id") do
  @stylists = Stylist.all()
  @client = Client.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:client)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

post("/clients") do
  name = params.fetch("name")
  client = Client.new({:name => name, :id => nil})
  client.save()
  @clients = Client.all()
  erb(:clients)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

patch("/clients/stylist/:id") do
  @client = Client.find(params.fetch("id").to_i())
  stylist_id = params.fetch("name")
  @client.update({:stylist_ids => stylist_ids})
  @stylists = Stylist.all()
  erb(:client)
  end

patch("/clients/edit/:id") do
  name = params.fetch("name")
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  erb(:client)
  end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

delete("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @clients = Client.all()
  erb(:clients)
end
