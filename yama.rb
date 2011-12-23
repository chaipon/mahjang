# -*- encoding: UTF-8 -*-
class Ringarray < Array
  def [](i)
    idx = i % size
    super(idx)
  end
end

class Yama
  Pai_num = 136
  Block = Pai_num / 4 #山の1ブロックの枚数
  def initialize(sai)
    print "enter initilaize\n" if $DEBUG
    @yama = Ringarray.new
    @kireme = 0
    @kireme = @kireme - (sai-1)*Block + sai*2
    @pointer = @kireme 
    tmp = []
    (0..Pai_num-1).each do |i|
      tmp[i] = i
    end
    srand()
    (1..Pai_num).each do |i|
      ransu = rand(Pai_num+1-i)
      print "ransu #{ransu} " if $DEBUG
      @yama[Pai_num-i] = Pai.new(tmp.slice!(ransu))
      print "yama #{Pai_num-i}\n" if $DEBUG
      p @yama[Pai_num-i] if $DEBUG
    end
  end

  def dora
    p @kireme if $DEBUG
    @yama[@kireme - 6].disp
  end

  def pai
    @pointer += 1
    @yama[@pointer - 1] 
  end

  def test
    for pai1 in 0..Pai_num-2
      for pai2 in pai1+1..Pai_num-1
        print "pai1=#{pai1},pai2=#{pai2}\n" if $DEBUG
        if @yama[pai1].id == @yama[pai2].id
          $stderr.print "Yama error 重複する牌あり!!\n"
          $stderr.print "pai1=#{pai1}:#{@yama[pai1].id},pai2=#{pai2}:#{@yama[pai2].id}\n"
          exit
        end
      end
    end
    if @yama.size != 136
      $stderr.print "Yama error!! 山の牌の数がおかしい\n"
      exit
    end
  end


end
