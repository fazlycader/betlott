class GameResult {
  final int id;
  final int gameId;
  final List<String> winningNumbers;
  final String createdAt;
  final String updatedAt;

  GameResult({
    required this.id,
    required this.gameId,
    required this.winningNumbers,
    required this.createdAt,
    required this.updatedAt,
    required String gameName,
  });

  factory GameResult.fromJson(Map<String, dynamic> json) {
    var winningNumbersJson = json['winning_numbers'];

    List<String> winningNumbers = [];

    if (winningNumbersJson is List) {
      // If 'winning_numbers' is already a list, directly assign it
      winningNumbers = winningNumbersJson.map((e) => e.toString()).toList();
    } else if (winningNumbersJson is String) {
      // If 'winning_numbers' is a string, convert it to a list
      winningNumbers =
          winningNumbersJson.split(',').map((e) => e.trim()).toList();
    }

    Map<String, dynamic> gameDetails = json['game_details'];
    String gameName = gameDetails['game_name'];

    return GameResult(
      id: 0, // No id available in API response
      gameId: 0, // No game_id available in API response
      winningNumbers: winningNumbers,
      createdAt: '', // No created_at available in API response
      updatedAt: '', // No updated_at available in API response
      gameName: gameName, // Extracted game name
    );
  }
}
