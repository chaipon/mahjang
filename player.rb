require "./yama.rb"

#
# プレイヤーのクラス
#
class Player
  #
  #初期化
  #
  def initialize(start_point)
    @point = start_point
    @tehai = []
  end
  def get_pai(yama)
    @tehai.push yama.pai
    if @tehai.size > 14
      STDERR.print "tehais are over 14\n"
    end
  end
  def put_hai
  end
  def get_pai4(yama)
    for i in 0..3
      @tehai.push yama.pai
    end
  end
  def riipai
    @tehai.sort!{|a,b|
      a.id <=> b.id
    }
  end

  def disp_tehai
    @tehai.sort!{|a,b|
      a.id <=> b.id
    }
    @tehai.each{|i|
      i.disp
    }
    puts 
  end
end
