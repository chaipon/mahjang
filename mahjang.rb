#!/usr/bin/ruby
# -*- encoding: UTF-8 -*-

require "pai.rb"
require "yama.rb"

def time_test(n)
  n.times{|i|
    print "\n",i,"times\t"
    yama = Yama.new
    #yama.test

    print "ドラ表示牌\t"
    yama.dora
    print "\n"
    tehai = []
    for i in 0..12
      p yama.pai if $DEBUG
      tehai[i] = yama.pai
    end

    tehai.sort!{|a,b|
      a.id <=> b.id
    }

    tehai.each{|i|
      i.disp
    }
  }
end

def throw_sai
  srand
  sai1 = rand(6) + 1
  srand
  sai2 = rand(6) + 1
  return sai1,sai2
end

def init
  startp = 25000
  for i in 0..3
    player[i] = Player.new(startp)
  end
end

sai1,sai2 = throw_sai
print "さいころ1(#{sai1}),さいころ2(#{sai2})\n"
sai = sai1 + sai2

yama = Yama.new(sai)
p yama if $DEBUG
yama.test

print "ドラ表示牌\n"
yama.dora
print "\n"
tehai = []


for i in 0..12
  p yama.pai if $DEBUG
  tehai[i] = yama.pai
end

tehai.sort!{|a,b|
  a.id <=> b.id
}

tehai.each{|i|
  i.disp
}

if ARGV.size > 0
  test_mode = ARGV[0].to_i
else
  test_mode = 0
end
  
if test_mode
  time_test(test_mode)
end
print "\n"
