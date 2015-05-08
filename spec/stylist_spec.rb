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

end
