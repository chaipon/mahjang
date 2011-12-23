# -*- encoding: UTF-8 -*-

# 
# 牌のクラス
#
class Pai

  attr_accessor :shurui,:kazu,:id

  #
  # 初期化
  # 1. idの設定
  # 2. idの設定
  #
  def initialize(rannsu)
    @id = rannsu # pai id
    case @id
    when 0..35 # Wans
      @shurui = Shurui_list[0]
      @kazu = @id/4+1
    when 36..71 #Pins
      @shurui = Shurui_list[1]
      @kazu = (@id-36)/4+1   
    when 72..107 #Sous
      @shurui = Shurui_list[2]
      @kazu = (@id-72)/4+1   
    when 108..123 #Sangenpai
      @shurui = Shurui_list[3]
      @kazu = Kaze_list[(@id-108)/4]   
    when 124..135 #Kazehai
      @shurui = Shurui_list[4]
      @kazu = Sangen[(@id-124)/4]   
    else
      print "Pai id Error @id = ",@id,"\n"
      exit
    end
  end
=begin
  --- Pai#disp
      display pai.
=end
  def disp
    print "\n",@shurui,",",@kazu,",",@id if $DEBUG
    case @shurui
    when "Kaze"
      print @kazu
    when "San"
      print @kazu
    when "Wan"
      print Wans[@kazu-1]
    when "Pin"
      print Pins[@kazu-1]
    when "Sou"
      print Sous[@kazu-1]
    end
  end
  
  #
  # Check pai to same as argument.
  #
  def is_same(target)
    if @shurui == target.shurui && @kazu == target.kazu
      return true
    end
    return false
  end
  def is_next(target)
    return false if @shurui == "Kaze" || @shurui == "San"
    if @shurui == target.shurui && @kazu+1 == target.kazu
      return true
    end
    return false
  end
  Shurui_list = ["Wan","Pin","Sou","Kaze","San"]
  Kaze_list = ["東","南","西","北"]
  Sangen = ["白","發","中"]
  Pins = ["①","②","③","④","⑤","⑥","⑦","⑧","⑨"]
  Sous = ["１","２","３","４","５","６","７","８","９"]
  Wans = ["一","二","三","四","五","六","七","八","九"]
end
