class Team {
  final String id;
  final String name;
  final String imageUrl;
  final String country;
  final String city;
  final String createDate;
  final String beforePointScore;
  final String currentPointScore;
  final String status; //LAST MATCH

  Team({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.country,
    required this.city,
    required this.createDate,
    required this.beforePointScore,
    required this.currentPointScore,
    required this.status,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'].toString(),
        name: json['name'],
        imageUrl: json['avatar'],
        country: json['country'],
        city: json['city'],
        createDate: json['createDate'],
        beforePointScore: json['beforePointScore'],
        currentPointScore: json['currentPointScore'],
        status: json['status'],
      );

}
