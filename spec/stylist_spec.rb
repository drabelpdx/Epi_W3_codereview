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


end
