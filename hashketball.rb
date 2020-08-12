require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored(name)
  game_hash.each do |team, game_data|
    game_data[:players].each do |player|
      if player[:player_name] == name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, game_data|
    game_data[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end 
  end 
end

def team_colors(team)
  game_hash.each do |home_away, game_data|
    if game_data[:team_name] == team
      return game_data[:colors]
    end
  end
end

def  team_names
  game_hash.map do |team, game_data|
    game_data[:team_name]
  end
end

def player_numbers(name)
  numbers = []
  game_hash.each do |team, game_data|
    if game_data[:team_name] == name
      game_data[:players].each do |player|
        numbers << player[:number]
      end
    end
  end
  numbers
end


def player_stats(player_name)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player|
      if player[:player_name] == player_name
        return player
      end
    end
  end
end

def big_shoe_rebounds
  counter = 0 
  shoe_size = 0
  game_hash.each do |home_away, game_data|
    game_data[:players].each do |stats|
     #binding.pry
      if stats[:shoe] > counter
        counter=stats[:shoe]
        shoe_size = stats[:rebounds]
      end
    end 
  end 
  return shoe_size
end

def most_points_scored
  counter=0 
  player = []
  game_hash.each do |home_away,game_data|
    game_data[:players].each do |stats|
      if stats[:points]>counter
        counter=stats[:points]
        player = stats[:player_name]
      end 
    end
  end
  return player 
end

def winning_team
  counter_1 = 0
  counter_2 = 0
  game_hash.each do |home_away,players|
    #binding.pry
    home_away[:home].each do |players,stats|
      counter_1 = counter_1+stats[:points]
    end
    home_away[:away].each do |players, stats|
      counter_2 = counter_2+stats[:points]
    end
    if counter_1>counter_2
      return home_away[:home]
    else return home_away[:away]
    end
  end
end

def home_team_score
  counter_h = 0
  game_hash.each do |home_away, players|
    players[:players].each do |stats|
      counter = counter + stats[:points]
    end
  end
  counter_h
end








