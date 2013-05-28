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