// ignore_for_file: public_member_api_docs, sort_constructors_first
class fam_Items {
  final dynamic id;
  final dynamic category;
  final dynamic name;
  final dynamic description;
  final dynamic images;
  final dynamic location;
  final dynamic likes;
  final dynamic dislikes;

  fam_Items({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.images,
    required this.location,
    required this.likes,
    required this.dislikes,
  });

  factory fam_Items.fromMap(Map<String, dynamic> map) {
    return fam_Items(
        id: map["id"],
        category: map["category"],
        name: map["item"],
        location: map["location"],
        likes: map["like"],
        dislikes: map["dislike"],
        images: map["images"],
        description: map["description"]);
  }
}

class famous_catalog {
  static List<fam_Items> fitems = [
    fam_Items(
        id: "default",
        category: 0,
        name: "",
        location: 0,
        likes: [],
        dislikes: [],
        images: '',
        description: "No Description")
  ];
  static fam_Items getbyid(String id) =>
      fitems.firstWhere((element) => element.id == id, orElse: () => fitems[0]);
}

class locations {
  final int id;
  final String locs;

  locations({required this.id, required this.locs});

  factory locations.fromMap(Map<String, dynamic> map) {
    return locations(id: map["id"], locs: map["location"]);
  }
}

class astd_location {
  static List<locations> flocs = [locations(id: 0, locs: '2')];
}
