# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Administrator.create(:email => %{marta.lidon@gmail.com}, :password => 'password', :password_confirmation => 'password')
  Administrator.create(:email => %{lfmarques2@gmail.com}, :password => '123123123', :password_confirmation => '123123123')
  Administrator.create(:email => %{albert@albert.al}, :password => '123123123', :password_confirmation => '123123123')
  Feedback.create(content: "Aplicacao Fantastica parabens aos alunos!!!")
  Feedback.create(content: "Aplicacao Mais ou menos :/")
  Feedback.create(content: "Aplicacao Fraca os alunos deviam chumbar :/")

  AreaOfInterest.create(:name => "Bioinformatica")
  AreaOfInterest.create(name: 'Ciencia e Engenharia de Software (SOFT-PT)')
  AreaOfInterest.create(name: 'Computacao Grafica')
  AreaOfInterest.create(name: 'Computacao Movel e Ubiqua (CMU)')
  AreaOfInterest.create(name: 'Computacao Paralela, Distribuida e de Larga Escala (CPDLA)')
  AreaOfInterest.create(name: 'Gestao de Dados e Conhecimento')
  AreaOfInterest.create(name: 'Seguranca de Sistemas de Computadores e Comunicacoes (SSCC)')
  AreaOfInterest.create(name: 'Sistemas Embebidos e de Tempo-Real (SETR)')
  AreaOfInterest.create(name: 'Sistemas Inteligentes')

  MapsVersion.create(version: '1')

  Location.create(title: 'FCT', image: 'FCT.png')

  Person.create(first_name: 'Marta', last_name: 'Lidon', prefix: 'Dr.', affiliation: 'FCT', email:'marta.lidon@gmail.com', signup_code: '1')
  Registry.create(email: 'marta.lidon@gmail.com', :password => '123123123', :password_confirmation => '123123123', person_id: '1')
  Person.create(first_name: 'Albert', last_name: 'Linde', prefix: 'Dr.', affiliation: 'FCT', email:'albert.linde@gmail.com', signup_code: '2')
  Registry.create(email: 'albert.linde@gmail.com', :password => '123qweasd', :password_confirmation => '123qweasd', person_id: '2')
  Person.create(first_name: 'Luis', last_name: 'Marques', prefix: 'Dr.', affiliation: 'FCT', email:'lfmarques2@gmail.com', signup_code: '3')
  Registry.create(email: 'lfmarques2@gmail.com', :password => '123123123', :password_confirmation => '123123123', person_id: '3')

  ##DAY 1
  EventGroup.create(:end => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 12:00", "%d/%m/%Y %H:%M"))
  Event.create(:event_group_id=>1, :title=>'Lunch and Registry', :description=> 'See title for more info.', :event_kind =>'Social Event', :begin=> DateTime.strptime("6/9/2013 12:00", "%d/%m/%Y %H:%M"), :end=> DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"));

  EventGroup.create(:end => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"))
  Event.create(:event_group_id=>2, :title=>'Starting Session', :description=> 'Start and the Turing session', :event_kind =>'Social Event', :begin=> DateTime.strptime("6/9/2013 13:00", "%d/%m/%Y %H:%M"), :end=> DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"));

  EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
  Event.create(:event_group_id=>3, :title=>'A', :description=> 'A', :event_kind =>'Paper Session', :begin=> DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end=> DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));
  EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
  Event.create(:event_group_id=>4, :title=>'B', :description=> 'B', :event_kind =>'Paper Session', :begin=> DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end=> DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));
  EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
  Event.create(:event_group_id=>5, :title=>'C', :description=> 'C', :event_kind =>'Paper Session', :begin=> DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end=> DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));
  EventGroup.create(:end => DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"))
  Event.create(:event_group_id=>6, :title=>'D', :description=> 'D', :event_kind =>'Paper Session', :begin=> DateTime.strptime("6/9/2013 14:00", "%d/%m/%Y %H:%M"), :end=> DateTime.strptime("6/9/2013 16:00", "%d/%m/%Y %H:%M"));

  GroupArea.create(area_of_interest_id: '5', event_group_id: '3');
  GroupArea.create(area_of_interest_id: '7', event_group_id: '4');
  GroupArea.create(area_of_interest_id: '6', event_group_id: '5');
  GroupArea.create(area_of_interest_id: '4', event_group_id: '6');

##DAY 2
EventGroup.create(:end => DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"), :date => DateTime.strptime("7/9/2013 09:00", "%d/%m/%Y %H:%M"))
Event.create(:event_group_id=>7, :title=>'Lorenzo Alvisi', :description=> 'UT AUSTIN.', :event_kind =>'Keynote', :begin=> DateTime.strptime("7/9/2013 09:00", "%d/%m/%Y %H:%M"), :end=> DateTime.strptime("7/9/2013 10:00", "%d/%m/%Y %H:%M"));
