class PetDetailsModel {
  final String id;
  final String petname;
  final String petDesc;
  final String amount;
  final String petImageUrl;
  final String ownername;
  final String ownerDesc;
  final String ownerImgUrl;
  final String age;
  final String sex;
  final String color;
  final String length;
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
    required this.age,
    required this.sex,
    required this.color,
    required this.length,
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
      age: json['age'],
      sex: json['sex'],
      color: json['color'],
      length: json['length'],
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
      'age': age,
      'sex': sex,
      'color': color,
      'length': length,
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
      age: map['age'],
      sex: map['sex'],
      color: map['color'],
      length: map['length'],
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
    String? age,
    String? sex,
    String? color,
    String? length,
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
      age: age ?? this.age,
      sex: sex ?? this.sex,
      color: color ?? this.color,
      length: length ?? this.length,
      favorite: favorite ?? this.favorite,
    );
  }
}
