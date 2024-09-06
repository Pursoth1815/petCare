import 'package:pet_care/core/constants/image_string.dart';

class PetCategoryRepo {
  PetCategoryRepo._();

  static List<Map<String, dynamic>> petCategoryList = [
    {
      'id': '1',
      'name': 'Dogs',
      'imageUrl': ImagePath.dog,
    },
    {
      'id': '2',
      'name': 'Cats',
      'imageUrl': ImagePath.cat,
    },
    {
      'id': '3',
      'name': 'Bunnies',
      'imageUrl': ImagePath.bunny,
    },
    {
      'id': '4',
      'name': 'Cow\'s',
      'imageUrl': ImagePath.cow,
    },
    {
      'id': '5',
      'name': 'Panda\'s',
      'imageUrl': ImagePath.panda,
    },
  ];
}
