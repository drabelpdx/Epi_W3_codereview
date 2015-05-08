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
  erb(:stylists)
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
  erb(:clients)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylists = Stylist.all()
  erb(:stylist)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

#   stylist_id = params.fetch("id").to_i()
#   @stylist = Stylist.find(stylist_id)
# # client_ids = params.fetch("client_ids")
#   @stylist.update({:name => name})
#   #@stylist.update({:client_ids => client_ids})
# #  @clients = Client.all()
#   erb(:stylists)
# end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:client)
end

patch("/clients/:id") do
  name = params.fetch("name")
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  erb(:client)
end
