class Replay < ActiveRecord::Base
  def parse_header
    # store_dir = Dir.pwd
    # Dir.chdir("/home/dguedes/Desktop/war3portal")
    # file = File.open("#{self.file_name}", "r")
    # self.data = file.read(48)
    # if !self.data.include?("Warcraft III recorded game\x1A")
    #   "Not a replay file"
    # end
    # file.close
  end

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

  def convert_visibility value
    case value
    when 0
      value = "Hide Terrain"
    when 1
      value = "Map Explored"
    when 2
      value = "Always Visible"
    when 3
      value = "Default"
    end
  end

  def convert_observers value
    case value
    when 0
      value = "No Observers"
    when 2
      value = "Observers on Defeat"
    when 3
      value = "Full Observers"
    when 4
      value = "Referees"
    end
  end

  def convert_game_type value
    case value
    when 0x01
      value = "Ladder 1vs1/FFA"
    when 0x09
      value = "Custom Game"
    when 0x0D
      value = "Single player/Local game"
    when 0x20
      value = "Ladder team game (AR/RT)"
    else
      value = "Unknown"
    end
  end

  def convert_color value
    case value
    when 0
      value = "Red"
    when 1
      value = "Blue"
    when 2
      value = "Teal"
    when 3
      value = "Purple"
    when 4
      value = "Yellow"
    when 5
      value = "Orange"
    when 6
      value = "Green"
    when 7
      value = "Pink"
    when 8
      value = "Gray"
    when 9 
      value = "Light-blue"
    when 10
      value = "Dark-green"
    when 11
      value = "Brown"
    when 12
      value = "Observer"
    end
  end

  #need fix
  def convert_race value
    if value.include?("hpea") && value.include?("0x01") && value.include?("0x41")
      value = "Human"
    elsif value.include?("opeo") && value.include?("0x02") && value.include?("0x42")
      value = "Orc"
    elsif value.include?("ewsp") && value.include?("0x04") && value.include?("0x44")
      value = "NightElf"
    elsif value.include?("uaco") && value.include?("0x08") && value.include?("0x48")
      value = "Undead"
    elsif value.include?("0x20") && value.include?("0x60")
      value = "Random"
    else
      value = 0
    end
  end

  def convert_ai value
    case value
    when 0x00
      value = "Easy"
    when 0x01
      value = "Normal"
    when 0x02
      value = "Insane"
    end
  end

  def convert_select_mode value
    case value
    when 0x00
      "Team & race selectable"
    when 0x01
      "Team not selectable"
    when 0x03
      "Team & race not selectable"
    when 0x04
      "Race fixed to random"
    when 0xCC
      "Automated Match Making (ladder)"
    end
  end

  def convert_chat_mode value, player="unknown"
    case value
    when 0x00
      value = "All"
    when 0x01
      value = "Allies"
    when 0x02
      value = "Observers"
    when 0xFE
      value = "The game has been paused by #{player}"
    when 0xFF
      value = "The game has been resumed by #{player}"
    else
      value -= 2
    end
  end
end
