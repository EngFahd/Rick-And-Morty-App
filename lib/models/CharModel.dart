class CharacterModel {
  final dynamic id;
  final String name;
  final dynamic status;
  final dynamic species;
  final dynamic type;
  final dynamic gender;
  final dynamic image;
  final dynamic location;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.location,
    // required this.episodes,
  });
  factory CharacterModel.fromJson(json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      location: json['location']['name'],
      image: json['image'],

      // episodes: json['episodes'].cast<String>(),
    );
  }
}

// class LocationModel {
//   final dynamic name;
//   final String url;

//   LocationModel({
//     required this.name,
//     required this.url,
//   });
//   factory LocationModel.fromJson(Map<String, dynamic> json) {
//     return LocationModel(
//       name: json['name'],
//       url: json['url'],
//     );
//   }
// }

// class testChar {
//   final dynamic name;
//   final dynamic status;
//   final dynamic species;

//   testChar({required this.name, required this.status, required this.species});
//   factory testChar.fromJson(json) {
//     return testChar(
//       name: json['name'],
//       status: json['status'],
//       species: json['species'],
//     );
//   }
// }
