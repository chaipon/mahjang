require "pai.rb"
require "player.rb"

class Computer < Player
  def agari()
    tehai = @tehai.dup
    return is_agari( tehai, false)
  end
  def is_agari( tehai, atama)
    tehai_shuntsu = tehai.dup
    tehai_kotsu = tehai.dup
    tehai_atama = tehai.dup
    result_atama = false

    return true if tehai.size == 0
    if tehai.size < 4
      #puts "nyago" if tehai.size < 12
      self.disp_tehai if tehai.size < 12
      #p tehai if tehai.size < 12
    end
    STDERR.print "Erro!!!! size 1. atama calls double!!!!!!!!\n" if tehai.size == 1

    result_shuntsu, tehai_shuntsu = get_shuntsu(tehai_shuntsu)  
    result_kotsu, tehai_kotsu = get_kotsu(tehai_kotsu)  
    result_atama, tehai_atama = get_atama(tehai_atama) unless atama  

    result_shuntsu = is_agari(tehai_shuntsu, atama) if result_shuntsu  
    result_kotsu = is_agari(tehai_kotsu, atama) if result_kotsu  
    result_atama = is_agari(tehai_atama, true) if result_atama  
    return result_shuntsu || result_kotsu || result_atama  
  end
  def get_shuntsu tehai
    shuntsu = [0]
    first_pai = tehai[0]
    second_pai = nil
    return false, tehai if tehai.size < 3
    tehai.each_with_index{|pai, index|
      return false, tehai unless first_pai.shurui == pai.shurui
      unless second_pai 
        if first_pai.is_next(pai)
          second_pai = pai
          shuntsu.push index
        end
      else
        if second_pai.is_next(pai)
          shuntsu.push index
          delete_tehai(tehai, shuntsu)
          return true, tehai
        end
      end
    }
    return false, tehai
  end

  def get_kotsu tehai
    return false, tehai if tehai.size < 3
    if tehai[0].is_same(tehai[1]) && tehai[0].is_same(tehai[2])
      delete_tehai(tehai, [0,1,2])
      return true, tehai
    end
    return false, tehai
  end
  def get_atama tehai
    return false, tehai if tehai.size < 2
    if tehai[0].is_same(tehai[1])
      delete_tehai(tehai, [0,1])
      return true, tehai
    end
    return false, tehai
  end
  def delete_tehai(tehai, indexes)
    indexes.each_with_index{|index, count|
      tehai.slice!(index-count)
    }
  end
end
