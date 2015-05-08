
Kiki's Hair Salon App

This app allows Kiki to add, view, edit and delete the records of Stylists and Clients who use her salon.


Setup
Requires Sinatra


Database structure is as follows:

  Databases:
    hair_salon_test
    hair_salon_test

  Tables:
    clients (id serial PRIMARY KEY, name varchar)
    stylists (id serial PRIMARY KEY, name varchar)
    clients_stylists (client_id int, stylist_id int)


Known issues
The program does not currently assign a Client to a specific Stylist as it should. The lack of that feature prevents the list of clients from displaying under each Stylist.


Author
David Abel
drabelpdx@gmail.com


License
MIT license
