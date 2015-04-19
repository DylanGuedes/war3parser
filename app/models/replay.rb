class Replay < ActiveRecord::Base
  def convert_speed value
    case value
    when 0
      value = "Slow"
    when 1
      value = "Normal"
    when 2
      value = "Fast"
    end
  end
end
