class TrucoBet

  attr_accessor :game

  def initialize(game)
    @game = game
    @score = 0
  end

  def players
    game.players
  end

  def score
    @score
  end

  def truco(player)
    @cantador_truco = player
    @score += 1
  end

  def quiero_y_retruco
    @score = 3
    cambiar_el_contador_de_truco
  end

  def quiero_y_vale_nueve
    @score = 9
    cambiar_el_contador_de_truco
  end

  def quiero_y_vale_juego
    @score = game.end_game_score
    cambiar_el_contador_de_truco
  end

  def no_quiero
    @winner = @cantador_truco
  end

  def quiero
    if @score == 1
      @score = 3
    elsif @score == 3
      @score = 5
    elsif @score == 5
      @score = 9
    end
  end

  def winner=(player)
    @winner = player
  end

  def winner
    @winner
  end

  private

  def cambiar_el_contador_de_truco
    @cantador_truco = game.players.reject { |p| p == @cantador_truco }[0]
  end

  # - el primer player puede decir vale nueve
  # - el segundo player puede decir si o no
  # - el segundo player puede decir vale partido
  # - el player player puede decir si o no
  #
end
