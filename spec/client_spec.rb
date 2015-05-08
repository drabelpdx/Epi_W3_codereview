require("spec_helper")

describe(Client) do

  describe("#name") do
    it("returns the clients's name") do
      client = Client.new({:name => "Bob", :id => nil})
      expect(client.name()).to(eq("Bob"))
    end
  end

  describe('#id') do
    it('returns the id')do
    client = Client.new ({:name => "Bob", :id => 1})
    expect(client.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("starts off empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a client by his/her id") do
      test_client = Client.new({:name => "Sally", :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Marc", :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe('#==') do
    it('is the same client if it has the same name and id') do
      client = Client.new({:name => "Sally", :id => nil })
      client2 = Client.new({:name => "Sally", :id => nil})
      expect(client).to(eq(client2))
    end
  end

  describe('#update') do
    it('lets you update a client in the database') do
      client = Client.new({:name => 'Patty', :id => nil})
      client.save()
      client.update({:name => 'Patti'})
      expect(client.name()).to(eq('Patti'))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client = Client.new({:name => "Sally", :id => nil})
      client.save()
      client2 = Client.new({:name => "Marc", :id => nil})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

end
