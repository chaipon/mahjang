require '../yama'
describe Player, "配パイ時"  do
  before do
    @player = Player.new(24999)
    @yama = Yama.new(1)
  end
  it "15牌" do
    1.upto(15) do
      @player.get_pai(@yama)
    end
  end
end
