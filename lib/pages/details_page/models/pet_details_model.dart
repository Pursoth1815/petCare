class PetDetailsModel {
  final String id;
  final String petname;
  final String petDesc;
  final String amount;
  final String petImageUrl;
  final String ownername;
  final String ownerDesc;
  final String ownerImgUrl;
  bool favorite;

  PetDetailsModel({
    required this.id,
    required this.petname,
    required this.petDesc,
    required this.amount,
    required this.petImageUrl,
    required this.ownername,
    required this.ownerDesc,
    required this.ownerImgUrl,
    this.favorite = false,
  });

  factory PetDetailsModel.fromJson(Map<String, dynamic> json) {
    return PetDetailsModel(
      id: json['id'],
      petname: json['petname'],
      petDesc: json['petDesc'],
      amount: json['amount'],
      petImageUrl: json['petImageUrl'],
      ownername: json['ownername'],
      ownerDesc: json['ownerDesc'],
      ownerImgUrl: json['ownerImgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'petname': petname,
      'petDesc': petDesc,
      'amount': amount,
      'petImageUrl': petImageUrl,
      'ownername': ownername,
      'ownerDesc': ownerDesc,
      'ownerImgUrl': ownerImgUrl,
      'fav': favorite,
    };
  }

  factory PetDetailsModel.fromMap(Map<String, dynamic> map) {
    return PetDetailsModel(
      id: map['id'],
      petname: map['petname'],
      petDesc: map['petDesc'],
      amount: map['amount'],
      petImageUrl: map['petImageUrl'],
      ownername: map['ownername'],
      ownerDesc: map['ownerDesc'],
      ownerImgUrl: map['ownerImgUrl'],
    );
  }

  PetDetailsModel copyWith({
    String? id,
    String? petname,
    String? petDesc,
    String? amount,
    String? petImageUrl,
    String? ownername,
    String? ownerDesc,
    String? ownerImgUrl,
    bool? favorite,
  }) {
    return PetDetailsModel(
      id: id ?? this.id,
      petname: petname ?? this.petname,
      petDesc: petDesc ?? this.petDesc,
      amount: amount ?? this.amount,
      petImageUrl: petImageUrl ?? this.petImageUrl,
      ownername: ownername ?? this.ownername,
      ownerDesc: ownerDesc ?? this.ownerDesc,
      ownerImgUrl: ownerImgUrl ?? this.ownerImgUrl,
      favorite: favorite ?? this.favorite,
    );
  }
}
