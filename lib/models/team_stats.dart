import 'package:foottalents/Models/team.dart';

class TeamStats extends Team{

  int playedMatches;
  int won;
  int loss;
  int GF;// goal for
  int GA;// goal againstt

  TeamStats({required super.id, required super.name, required super.imageUrl, required super.country, required super.city, required super.createDate, required super.beforePointScore, required super.currentPointScore, required super.status});

}