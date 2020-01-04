require 'pry'

def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end

def num_points_scored(name)

  game_hash.each do |place, team|
    team.each do |attribute, data|

      if attribute == :players
        data.each do |player_data|
          if player_data[:player_name] == name

            return player_data[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |team_color_players, data|

      if team_color_players == :players
        data.each do |player_data|
          if name == player_data[:player_name]

            return player_data[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
      if team == team_data[:team_name]
        return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  player_nums = []
  game_hash.each do |location, team_data|

    if team_data[:team_name] == team_name
      team_data.each do |team_color_players, data|

        if team_color_players == :players
          data.each do |player_stats|

            if player_stats.has_key?(:number)

              player_nums << player_stats[:number]

            end
          end
        end
      end
    end
  end
  player_nums
end


def player_stats(player)
  player_stats = {}

  game_hash.each do |location, team_data|
    if team_data.has_key?(:players)

    (team_data[:players]).each do |team_color_players|

      if team_color_players[:player_name] == player
        new_cloned_hash = team_color_players.clone
        new_cloned_hash.delete(:player_name)
        return new_cloned_hash

        end
      end
    end
  end
end


def big_shoe_rebounds
  player_shoe_size = 0
  player_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > player_shoe_size
        player_shoe_size = player[:shoe]
        player_rebounds = player[:rebounds]
    # binding.pry
    # team_data.each do |team_color_players, data|
      end
    end
  end
  player_rebounds
end



def most_points_scored
  most_points = 0
  player_name = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      # binding.pry
      if player[:points] > most_points
        most_points = player[:points]
        player_name = player[:player_name]

      end
    end
  end
    most_points
    player_name
end

def winning_team
  score_count = {:Charlotte_Hornets => 0, :Brooklyn_Nets => 0}

    game_hash.each do |location, team_data|
      team_name = team_data[:team_name]
      score_count[team_name] += player[:points]



      if team_data[:team_name] == "Charlotte Hornets"
        team_data[:players].each do |player|
          score_count[:Charlotte_Hornets] += player[:points]
          binding.pry
          end
      else
        team_data[:players].each do |player|
          nets_total += player[:points]
          end
        end
      end
      [hornets_total, nets_total].max
score_count
    end
