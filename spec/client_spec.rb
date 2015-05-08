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

end
