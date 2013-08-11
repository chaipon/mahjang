#!/usr/bin/ruby
require './pai.rb'
require './computer.rb'
require './yama.rb'
tenho = 0
chiho = 0


1.upto(ARGV[0].to_i){|i|
  player = Computer.new(1000) #=>
  player2 = Computer.new(1000) #=>
  player3 = Computer.new(1000) #=>
  player4 = Computer.new(1000) #=>
  yama = Yama.new(1) #=>
  0.upto(2){
    player.get_pai4(yama) #=>
    player2.get_pai4(yama) #=>
    player3.get_pai4(yama) #=>
    player4.get_pai4(yama) #=>
  }
  player.get_pai(yama) #=>
  player2.get_pai(yama) #=>
  player3.get_pai(yama) #=>
  player4.get_pai(yama) #=>
  player.get_pai(yama) #=>
  player2.get_pai(yama) #=>
  player3.get_pai(yama) #=>
  player4.get_pai(yama) #=>
  player.riipai
  player2.riipai
  player3.riipai
  player4.riipai
  #p player
  #player.disp_tehai
  #puts "\nNo" unless player.agari
  if player.agari
    puts "\nTenho  #{i}!!!!"
    tenho += 1
  end
  if player2.agari or player3.agari or player4.agari
    puts "\nChiho  #{i}!!!!"
    chiho += 1
  end
  if i % 1000 == 0
    puts i
  end
}
puts "End", tenho, chiho

