require("spec_helper")

describe(Stylist) do

  describe("#name") do
    it("returns the stylist's name") do
      stylist = Stylist.new({:name => "Sally", :id => nil})
      expect(stylist.name()).to(eq("Sally"))
    end
  end

  describe('#id') do
    it('returns the id')do
    stylist = Stylist.new ({:name => "Sally", :id => 1})
    expect(stylist.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("starts off empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by his/her id") do
      test_stylist = Stylist.new({:name => "Sally", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Marc", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#==') do
    it('is the same stylist if it has the same name and id') do
      stylist = Stylist.new({:name => "Sally", :id => nil })
      stylist2 = Stylist.new({:name => "Sally", :id => nil})
      expect(stylist).to(eq(stylist2))
    end
  end

  describe('#update') do
    it('lets you update a stylist in the database') do
      stylist = Stylist.new({:name => 'Mark', :id => nil})
      stylist.save()
      stylist.update({:name => 'Marc'})
      expect(stylist.name()).to(eq('Marc'))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Sally", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Marc", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe("#clients") do
    it("returns all of the clients assigned to a stylist") do
      stylist = Stylist.new({:name => "Marc", :id => nil})
      stylist.save()
      george = Client.new({:name => "George", :id => nil})
      george.save()
      brad = Client.new({:name => "Brad", :id => nil})
      brad.save()
      stylist.update({:client_ids => [george.id(), brad.id()]})
      expect(stylist.clients()).to(eq([george, brad]))
    end
  end


end
