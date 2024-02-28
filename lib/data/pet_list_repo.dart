import 'package:pet_care/common/utils/image_string.dart';
import 'package:pet_care/pages/details_page/models/pet_details_model.dart';

class PetListRepo {
  PetListRepo._privateConstructor();
  static final PetListRepo _instance = PetListRepo._privateConstructor();

  factory PetListRepo() {
    return _instance;
  }

  List<String> _petFavoriteLists = [];

  List<String> get petFavoriteLists => _petFavoriteLists;

  void toggleFavorite(PetDetailsModel item) {
    if (_petFavoriteLists.contains(item.id)) {
      _petFavoriteLists.remove(item.id);
      item.favorite = false;
    } else {
      _petFavoriteLists.add(item.id);
      item.favorite = true;
    }
  }

  static List<Map<String, dynamic>> petDetailsList = [
    {
      'id': '1',
      'petname': 'Scooby',
      'petDesc': 'Lorem ipsum dolor',
      'amount': '9000',
      'petImageUrl': ImagePath.dog2,
      'ownername': 'Kaviyaa',
      'ownerDesc': 'Vix eu dico possit, vim te inani fabulas insolens, in',
      'ownerImgUrl': ImagePath.user3,
    },
    {
      'id': '2',
      'petname': 'Silk',
      'petDesc': 'amet, dicam timeam',
      'amount': '12000',
      'petImageUrl': ImagePath.dog4,
      'ownername': 'Pursoth',
      'ownerDesc': ' pri et falli detracto. Has iriure labitur eu',
      'ownerImgUrl': ImagePath.user4,
    },
    {
      'id': '3',
      'petname': 'Jon',
      'petDesc': 'vix ei, cu mea',
      'amount': '5500',
      'petImageUrl': ImagePath.dog3,
      'ownername': 'Vikram',
      'ownerDesc': 'At regione conclusionemque his, ius cu corrumpit',
      'ownerImgUrl': ImagePath.user2,
    },
    {
      'id': '4',
      'petname': 'Dumbo',
      'petDesc': 'petentium reformidans. Eu',
      'amount': '7250',
      'petImageUrl': ImagePath.dog5,
      'ownername': 'Rambo',
      'ownerDesc': 'ei, cu mea dictas evertitur intellegebat pri.',
      'ownerImgUrl': ImagePath.user1,
    },
  ];
}
