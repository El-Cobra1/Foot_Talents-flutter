
class Player {
  final String id;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String email;
  final String nationality;
  final String city;
  final String birthDate;
  final String height;
  final String weight;
  final String position;
  final String secondaryPosition;
  final String foot;
  final bool active;

  Player({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.email,
    required this.nationality,
    required this.city,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.position,
    required this.secondaryPosition,
    required this.foot,
    required this.active,
  });

  factory Player.fromJson(Map<String,dynamic> json) => Player(
      id: json['id'].toString(),
      firstName: json['firstName'],
      lastName: json['lastName'],
      imageUrl: json['avatar'],
      email: json['email'],
      nationality: json['nationality'],
      city: json['city'],
      birthDate: json['birthDate'],
      height: json['height'],
      weight: json['weight'],
      position: json['position'],
      secondaryPosition: json['secondaryPosition'],
      foot: json['foot'],
      active: json['active'],
    );
}
