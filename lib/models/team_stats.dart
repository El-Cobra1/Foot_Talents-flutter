import 'package:foottalents/Models/team.dart';

class TeamStats extends Team{

  final int playedMatches;
  final int won;
  final int loss;
  final int GF;// goal for
  final int GA;// goal against

  TeamStats(this.playedMatches, this.won, this.loss, this.GF, this.GA, {required super.id, required super.name, required super.imageUrl, required super.country, required super.city, required super.createDate, required super.beforePointScore, required super.currentPointScore, required super.status});

}