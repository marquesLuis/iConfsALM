# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Adding Administrators"
# ADMINISTRATORS (1-3)
Administrator.create(:email => %{marta.lidon@gmail.com}, :password => 'password', :password_confirmation => 'password')
Administrator.create(:email => %{lfmarques2@gmail.com}, :password => '123123123', :password_confirmation => '123123123')
Administrator.create(:email => %{albert@albert.al}, :password => '123123123', :password_confirmation => '123123123')

puts "Adding Feedback"
# FEEDBACK (1-3)
Feedback.create(content: "Aplicacao Fantastica parabens aos alunos!!!")
Feedback.create(content: "Aplicacao Mais ou menos :/")
Feedback.create(content: "Aplicacao Fraca os alunos deviam chumbar :/")

puts "Adding Notifications"
# NOTIFICATIONS (1-2)
OrgNotification.create(title: "L. Alvisi is sick.", content: "And thus the session may or not be. At the worst we will provide playing cards.")
OrgNotification.create(title: "Bus schedule (Ibis Hotel)", content: "The bus departs from the entrance of the hotel at 08.00. Return trip will be at 19.00 sharp, check the location at the maps page under 'bus location'")

puts "Adding Areas of Interest"
# AREAS OF INTEREST (1-9)
AreaOfInterest.create(:name => "Bioinformatica")
AreaOfInterest.create(name: 'Ciencia e Engenharia de Software (SOFT-PT)')
AreaOfInterest.create(name: 'Computacao Grafica')
AreaOfInterest.create(name: 'Computacao Movel e Ubiqua (CMU)')
AreaOfInterest.create(name: 'Computacao Paralela, Distribuida e de Larga Escala (CPDLA)')
AreaOfInterest.create(name: 'Gestao de Dados e Conhecimento')
AreaOfInterest.create(name: 'Seguranca de Sistemas de Computadores e Comunicacoes (SSCC)')
AreaOfInterest.create(name: 'Sistemas Embebidos e de Tempo-Real (SETR)')
AreaOfInterest.create(name: 'Sistemas Inteligentes')

puts "Adding Locations"
# LOCATIONS (1-4)
Location.create(title: 'Hotel Ibis Departure', image: 'bus.jpg')
Location.create(title: 'Campus', image: 'mapacampus.jpg')
Location.create(title: 'Conference Location', image: 'conflocation.jpg')
Location.create(title: 'Getting to FCT', image: 'localizacaofct.gif')
MapsVersion.create(version: '1')

puts "Adding people: marta, albert, luis"
#PEOPLE & REGISTRY (1-3)
Person.create(first_name: 'Marta', last_name: 'Lidon', prefix: 'Dr.', affiliation: 'FCT', email: 'marta.lidon@gmail.com', signup_code: '1')
Registry.create(email: 'marta.lidon@gmail.com', :password => '123123123', :password_confirmation => '123123123', person_id: '1')
Person.create(first_name: 'Albert', last_name: 'Linde', prefix: 'Dr.', affiliation: 'FCT', email: 'albert.linde@gmail.com', signup_code: '2')
Registry.create(email: 'albert.linde@gmail.com', :password => '123qweasd', :password_confirmation => '123qweasd', person_id: '2')
Person.create(first_name: 'Luis', last_name: 'Marques', prefix: 'Dr.', affiliation: 'FCT', email: 'lfmarques2@gmail.com', signup_code: '3')
Registry.create(email: 'lfmarques2@gmail.com', :password => '123123123', :password_confirmation => '123123123', person_id: '3')


puts "Adding Day 1"
#DAY 1 -> EVENT GROUP (1-6) EVENT (1-6) GROUP AREA (1-4)
EventGroup.create(:end => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 12:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 1, :title => 'Lunch and Registry', :description => 'See title for more info.', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 12:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"));

EventGroup.create(:end => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 2, :title => 'Starting Session', :description => 'Start and the Turing session', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"));

EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 3, :title => 'A', :description => 'A', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));
EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 4, :title => 'B', :description => 'B', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));
EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 5, :title => 'C', :description => 'C', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));
EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 6, :title => 'D', :description => 'D', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));

GroupArea.create(area_of_interest_id: '5', event_group_id: '3');
GroupArea.create(area_of_interest_id: '7', event_group_id: '4');
GroupArea.create(area_of_interest_id: '6', event_group_id: '5');
GroupArea.create(area_of_interest_id: '4', event_group_id: '6');

puts "Adding Day 2"
##DAY 2 EVENT GROUP (7) EVENT (7)
EventGroup.create(:end => DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("7/9/2013 09:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 7, :title => 'Lorenzo Alvisi', :description => 'UT AUSTIN.', :event_kind => 'Keynote', :begin => DateTime.strptime("7/9/2013 09:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"));


prefixes = ["Dr.", "Sr."]
first_names = ["Bev",
               "Lowell",
               "Britta",
               "Lorretta",
               "Lashay",
               "Todd",
               "Lane",
               "Letisha",
               "Kortney",
               "Jayson",
               "Lorri",
               "Serita",
               "Fran",
               "Agatha",
               "Donald",
               "Lenore",
               "Ella",
               "Awilda",
               "Shawana",
               "Reatha"]
last_names = ["Babineau",
              "Wenner",
              "Hurla",
              "Roselli",
              "Mcbrayer",
              "Pressman",
              "Bergeron",
              "Alberto",
              "Trinkle",
              "Thurman",
              "Wrona",
              "Olmstead",
              "Fitzwater",
              "Borquez",
              "Bloomberg",
              "Chappel",
              "Overly",
              "Fetterolf",
              "Haver",
              "Witte"]
affiliations = ["fct", "unl", 'ist', 'random entity']



puts "Adding 100 random people"
1.upto(200) do |i|
  if i == 50
    puts "Done 50, almost there"
  end
  r=Random.rand(10);
  a =Person.create(
      first_name: first_names[(r+i)%first_names.length],
      last_name: last_names[(r+i)%last_names.length],
      prefix: prefixes[(r+i)%prefixes.length],
      affiliation: affiliations[(r+i)%affiliations.length],
      email: first_names[(r+i)%first_names.length]+"#{i}"+last_names[(r+i)%last_names.length]+"@"+affiliations[(r+i)%affiliations.length]+"AasdAmail.com",
      signup_code: "seeded:#{i}"
  )
  Registry.create(
      :email => a.email,
      :password => '123123123',
      :password_confirmation => '123123123',
      :person_id => a.id)
end

