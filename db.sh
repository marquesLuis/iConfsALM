rm /Users/lfmarques/Library/Application\ Support/iPhone\ Simulator/6.1/Applications/74BD9E5C-383E-4258-9A2F-FBDC38485888/Documents/*.db
rake db:drop
rake db:migrate
rake db:reset
rails s

