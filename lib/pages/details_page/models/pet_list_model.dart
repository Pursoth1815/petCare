class PetListModel {
  final String id;
  final String name;
  final String imageUrl;
  bool selected;

  PetListModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.selected = false,
  });

  factory PetListModel.fromJson(Map<String, dynamic> json) {
    return PetListModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory PetListModel.fromMap(Map<String, dynamic> map) {
    return PetListModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  PetListModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    bool? selected,
  }) {
    return PetListModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      selected: selected ?? this.selected,
    );
  }
}
