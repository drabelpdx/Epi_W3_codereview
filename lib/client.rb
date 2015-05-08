class Client

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
     result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
     @id = result.first().fetch("id").to_i()
   end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i()
      clients.push(Client.new({:name => name, :id => id}))
     end
     clients
   end

   define_singleton_method(:find) do |id|
     result = DB.exec("SELECT * FROM clients WHERE id = #{id};")
     name = result.first().fetch('name')
     Client.new({:name => name, :id => id})
   end

   define_method(:==) do |another_client|
     self.name().==(another_client.name()).&(self.id().==(another_client.id()))
   end


end
