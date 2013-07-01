# encoding: utf-8
#
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
OrgNotification.create(title: "Bus schedule (Ibis Hotel)", content: "The bus departs from the entrance of the hotel at 08.00. Return trip will be at 19.00 sharp, check the location at the maps page under bus location")

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
Location.create(title: 'Conference Location', image: 'conflocation.jpg')
Location.create(title: 'Getting to FCT', image: 'localizacaofct.jpg')
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
#DAY 1 -> EVENT GROUP (1-X) EVENT (1-X) GROUP AREA (1-X)

#1 1
EventGroup.create(:end => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 12:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 1, :title => 'Lunch and Registry', :description => 'See title for more info.', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 12:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"));

#2 2
EventGroup.create(:end => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 2, :title => 'Starting Session', :description => 'Start and the Turing session', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"));

#3 3
EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 3, :title => 'CPDLA1', :description => 'C2FS: um Sistema de Ficheiros Seguro e Fiável para Cloud-of-clouds - Ricardo Mendes, Tiago Oliveira, Alysson Bessani, Marcelo Pasin Benchmarking the EDGI Infrastructure-Serhiy Boychenko, Filipe Araújo Aplicação do Fecho de Programas na Deteção de Anomalias de Concorrência-Diogo G. Sousa, João Lourenço, Eitan Farchi, Itai Segall RATS -- Resource Aware Thread Scheduling for JVM-level Clustering - Navaneeth Rameshan, Luís Veiga', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));

Person.create(first_name: 'Ricardo', last_name: 'Mendes', prefix: 'Dr.', affiliation: 'FCT', email: 'R.Mendes@gmail.com', :biography => 'Ricardo Cavalcante Mendes or simply Ricardinho (born September 4, 1989 in Sao Paulo) is a Brazilian football player who currently plays for Lechia Gdansk.', signup_code: '4')
Registry.create(email: 'R.Mendes@gmail.com', :password => '123123123', :password_confirmation => '123123123', person_id: '4')

PersonInterest.create(:person_id => 4, :area_of_interest_id => 2)
PersonInterest.create(:person_id => 4, :area_of_interest_id => 4)

Speaker.create(:keynote => false, :person_id => 4, :event_id => 3);


#4 4
EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 4, :title => 'SSCC', :description => 'DIVERSYS: DIVErse Rejuvenation SYStem-Miguel Garcia, Nuno Neves, Alysson Bessani O vigia dos vigias: um serviço RADIUS resiliente-Oleksandr Malichevskyy, Diego Kreutz, Marcelo Pasin, Alysson Bessani Trusted Civitas: Client Trust in CIVITAS Electronic Voting Protocol-Pedro Adão, João Mendes Minimização de Perda de Pacotes em Sistemas de Deteção de Intrusões-Tiago Picado, Paolo Romano, Carlos Ribeiro Gestão e Pesquisa de Dados Privados em Nuvens de Armazenamento-Bernardo Ferreira, Henrique Domingos', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));

#5 5
EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 5, :title => 'GDC1', :description => 'Semantic Enrichment of Places for the Portuguese Language-Jorge Oliveira Santos, Ana Oliveira Alves, Francisco Câmara Pereira, Pedro Henriques Abreu Extração de Relações em Títulos de Notícias Desportivas-António Paulo Santos, Carlos Ramos, Nuno C. Marques Natural Language Understanding as a classification process: report of initial experiments and results-Pedro Mota, Luísa Coheur Medicine.Ask: An intelligent search system for medicine information-Helena Galhardas, Vasco Mendes, Luísa Coheur', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));

#6 6
EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 6, :title => 'CMU1', :description => 'Comparação de Mecanismos de Cancelamento de Difusão-Rui Lima, Carlos Baquero, Hugo Miranda Filtros de precedência: agregação anónima de dados de trânsito bluetooth-Nelson Gonçalves, Carlos Baquero, Rui José, Miguel Borges Geo Ties -- Localização em Conversas Móveis-Tiago Antunes, Luís Duarte, Luis Carriço Puzzles: Explorando Designs Multimodais-Jaime Carvalho, Luís Duarte, Diogo Marques, Luis Carriço', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));

GroupArea.create(area_of_interest_id: '5', event_group_id: '3');
GroupArea.create(area_of_interest_id: '7', event_group_id: '4');
GroupArea.create(area_of_interest_id: '6', event_group_id: '5');
GroupArea.create(area_of_interest_id: '4', event_group_id: '6');

#7 7
EventGroup.create(:date => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 7, :title => 'Coffee break', :description => 'See title for more info.', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"));

#8,9,10
EventGroup.create(:date => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"))
EventGroup.create(:date => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"))
EventGroup.create(:date => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"))
#8,9,10
Event.create(:event_group_id => 8, :title => 'CPDLA2', :description => '', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 9, :title => 'SETR1', :description => '', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 10, :title => 'SOFTPT1', :description => '', :event_kind => 'Paper Session', :begin => DateTime.strptime("6/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"));
#11 11
EventGroup.create(:date => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 19:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 11, :title => 'Reunion', :description => 'Some detail should go here.', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 18:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 19:00", "%d/%m/%Y %H:%M"));
#12 12
EventGroup.create(:date => DateTime.strptime("6/9/2013 19:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 19:15", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 12, :title => 'Leaving for dinner', :description => 'Some detail should go here. Location maybe.', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 19:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 19:15", "%d/%m/%Y %H:%M"));
#13 13
EventGroup.create(:date => DateTime.strptime("6/9/2013 19:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 22:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 13, :title => 'Dinner', :description => 'Solar dos Zagalos', :event_kind => 'Social Event', :begin => DateTime.strptime("6/9/2013 19:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("6/9/2013 23:50", "%d/%m/%Y %H:%M"));


puts "Adding Day 2"
##DAY 2 EVENT GROUP () EVENT ()
EventGroup.create(:end => DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("7/9/2013 09:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 14, :title => 'Lorenzo Alvisi', :description => 'UT AUSTIN.', :event_kind => 'Keynote', :begin => DateTime.strptime("7/9/2013 09:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"));

EventGroup.create(:date => DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 18:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id => 15, :title => 'Coffee break', :description => 'See title for more info.', :event_kind => 'Social Event', :begin => DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 10:30", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'CPDLA3', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 10:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 12:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'SETR2', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 10:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 12:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'SOFTPT2', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 10:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 12:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'Lunch and Posters', :description => 'See title for more info.', :event_kind => 'Social Event', :begin => DateTime.strptime("7/9/2013 12:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 13:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'José Luiz Fiadeiro (Royal Holloway, University of London)', :description => 'See title for more info.', :event_kind => 'Keynote', :begin => DateTime.strptime("7/9/2013 13:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 14:00", "%d/%m/%Y %H:%M"));

Event.create(:event_group_id => 15, :title => 'GDC2', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 16:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'CMU2', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 16:0", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'IOT', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 14:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 16:00", "%d/%m/%Y %H:%M"));

Event.create(:event_group_id => 15, :title => 'Coffee break', :description => 'See title for more info.', :event_kind => 'Social Event', :begin => DateTime.strptime("7/9/2013 16:00", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 16:30", "%d/%m/%Y %H:%M"));

Event.create(:event_group_id => 15, :title => 'CPDLA4', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 18:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'SOFTPT3', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 18:00", "%d/%m/%Y %H:%M"));
Event.create(:event_group_id => 15, :title => 'GDC3', :description => 'See title for more info.', :event_kind => 'Paper Session', :begin => DateTime.strptime("7/9/2013 16:30", "%d/%m/%Y %H:%M"), :end => DateTime.strptime("7/9/2013 18:00", "%d/%m/%Y %H:%M"));

prefixes = ["", "Dr.", "Sr."]
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
1.upto(100) do |i|
  if i == 50
    puts "Done 50, almost there"
  end
  r=Random.rand(10);
  r2=Random.rand(10);
  a =Person.create(
      first_name: first_names[(r+i)%first_names.length],
      last_name: last_names[(r2+i)%last_names.length],
      prefix: prefixes[(r+r2+i)%prefixes.length],
      affiliation: affiliations[(r+i)%affiliations.length],
      email: first_names[(r+i)%first_names.length]+"#{i}"+last_names[(r2+i)%last_names.length]+"@"+affiliations[(r+i)%affiliations.length]+"AasdAmail.com",
      signup_code: "seeded:#{i}"
  )
  Registry.create(
      :email => a.email,
      :password => '123123123',
      :password_confirmation => '123123123',
      :person_id => a.id)
end

Networking.create(:title => 'Scalable Bloom Filters', :content => 'Description.', :person_id => '2');
Networking.create(:title => 'PastisD', :content => 'Description.', :person_id => '1');
Networking.create(:title => 'ABD Development', :content => 'Description.', :person_id => '3');
Networking.create(:title => 'C2FS', :content => 'C2FS: um Sistema de Ficheiros Seguro e Fiável para Cloud-of-clouds. Vários sistemas surgiram recentemente com o intuito de facilitar a utilização de serviços de armazenamento nas clouds. Muitos utilizadores das clouds têm a necessidade de manter os seus dados disponíveis e privados, requisitos nem sempre atendidos pelos sistemas de armazenamento em cloud. Recentemente foi demonstrado que é possível atender estes requisitos através do uso de vários provedores de cloud, ao invés de um só, ao que foi dado o nome de cloud-of clouds. Com vista a responder a estas necessidades apresentamos o C2FS, um sistema de ficheiros multi-utilizador para cloud-of-clouds. Este sistema é tolerante a falhas por parte dos provedores de clouds e mantém a privacidade dos dados e metadados armazenados desde que menos de um terço dos provedoresusados sejam faltosos. O C2FS tem uma interface estilo POSIXe satisfaz um modelo de consistência flexível que permite aos seus utilizadores controlarem os custos (em termos monetários e de desempenho)relacionados com o acesso a clouds e as garantias de consistência e durabilidade oferecidas pelo sistema.', :person_id => '4');
NetworkingInterest.create(:networking_id => 2, :area_of_interest_id => 5)

Note.create(:content => 'Must not forget to bring my IPhone (MARTA).', :person_id => 1);
Note.create(:content => 'Talked to him in the coffee break', :person_id => 1);
Note.create(:content => 'Must not forget to bring my IPhone. (Albert)', :person_id => 2);
Note.create(:content => 'Talked to him in the coffee break', :person_id => 2);
Note.create(:content => 'Must not forget to bring my IPhone. (Luis)', :person_id => 3);
Note.create(:content => 'Talked to him in the coffee break (Luis)', :person_id => 3);
AboutPerson.create(:person_id => 4, :note_id => 2)
AboutPerson.create(:person_id => 4, :note_id => 4)
AboutPerson.create(:person_id => 4, :note_id => 6)

PendingContact.create(:requester_id => 8, :requested_id => 1)
PendingContact.create(:requester_id => 5, :requested_id => 1)
PendingContact.create(:requester_id => 6, :requested_id => 1)
PendingContact.create(:requester_id => 7, :requested_id => 1)
PendingContact.create(:requester_id => 8, :requested_id => 2)
PendingContact.create(:requester_id => 5, :requested_id => 2)
PendingContact.create(:requester_id => 6, :requested_id => 2)
PendingContact.create(:requester_id => 7, :requested_id => 2)
PendingContact.create(:requester_id => 8, :requested_id => 3)
PendingContact.create(:requester_id => 5, :requested_id => 3)
PendingContact.create(:requester_id => 6, :requested_id => 3)
PendingContact.create(:requester_id => 7, :requested_id => 3)

TradedContact.create(:requester_id => 4, :requested_id => 3)
TradedContact.create(:requester_id => 4, :requested_id => 2)
TradedContact.create(:requester_id => 4, :requested_id => 1)
