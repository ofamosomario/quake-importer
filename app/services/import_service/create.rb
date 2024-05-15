# frozen_string_literal: true

# ImporterServices
module ImportService
  # The create class is regarding to import and parse the file
  class Create
    def initialize(file)
      @file = file
    end

    def call
      return false unless @file.present?

      parse_log_file
    end

    private

    def parse_log_file
      games = {}
      current_game = {}
      game_count = 0

      File.foreach(@file) do |line|
        case line
        when /InitGame/
          game_count += 1
          current_game = initialize_new_game
        when /ShutdownGame/
          games["game_#{game_count}"] = current_game if current_game
          current_game = nil
        when /Kill:/
          process_kill_info(line, current_game) if current_game
        end
      end

      games
    end

    def initialize_new_game
      { total_kills: 0, players: [], kills: {}, kills_by_means: {} }
    end

    def process_kill_info(line, current_game)
      match_data = line.match(/Kill: \d+ \d+ \d+: (.+) killed (.+) by (.+)/)

      return unless match_data

      killer = match_data[1]
      victim = match_data[2]
      weapon = match_data[3]

      current_game[:total_kills] += 1

      unless current_game[:players].include?(killer)
        return if line.include?('<world>')

        current_game[:players] << killer
        current_game[:kills][killer] = 0
      end

      unless current_game[:players].include?(victim)
        current_game[:players] << victim
        current_game[:kills][victim] = 0
      end

      current_game[:players].uniq!

      update_kills(current_game, killer, victim)
      updated_weapon_type(current_game, weapon)
      sort_kills(current_game)
      sort_weapon_type(current_game)
    end

    def update_kills(current_game, killer, victim)
      if killer == '<world>'
        current_game[:kills][victim] -= 1
      else
        current_game[:kills][killer] += 1
      end
    end

    def updated_weapon_type(current_game, weapon)
      current_game[:kills_by_means][weapon] ||= 0
      current_game[:kills_by_means][weapon] += 1
    end

    def sort_kills(current_game)
      current_game[:kills] = current_game[:kills].sort_by { |_player, kills| -kills }.to_h
    end

    def sort_weapon_type(current_game)
      current_game[:kills_by_means] = current_game[:kills_by_means].sort_by { |_player, weapon| -weapon }.to_h
    end
  end
end
