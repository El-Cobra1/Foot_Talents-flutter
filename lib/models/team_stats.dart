import 'package:foottalents/Models/team.dart';

class TeamStats {
  final int playedMatches;
  final int won;
  final int loss;
  final int GF; // goal for
  final int GA; // goal against
  final Team? team;

  TeamStats(
      {required this.playedMatches,
      required this.won,
      required this.loss,
      required this.GF,
      required this.GA,
      this.team});

  factory TeamStats.fromJson(Map<String, dynamic> json) => TeamStats(
        playedMatches: json[''],
        won: json[''],
        loss: json[''],
        GF: json[''],
        GA: json[''],
      );
}
