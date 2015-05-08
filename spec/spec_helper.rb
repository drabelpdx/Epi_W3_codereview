require("rspec")
require("pg")
require("stylists")
require("clients")

DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylist *;")
    DB.exec("DELETE FROM clients *;")
  end
end
