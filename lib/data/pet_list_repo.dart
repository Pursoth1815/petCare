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
      'ownerDesc': 'Vix eu dico possit, vim te inani fabuor sit amet, consectetur adipisci ut labore et minim veniam, quis nostrud exercitation ullamco labor',
      'ownerImgUrl': ImagePath.user3,
      'age': '3',
      'sex': 'Male',
      'color': 'Brown',
      'length': '2.3'
    },
    {
      'id': '2',
      'petname': 'Silk',
      'petDesc': 'amet, dicam timeam',
      'amount': '12000',
      'petImageUrl': ImagePath.dog4,
      'ownername': 'Pursoth',
      'ownerDesc':
          'Lorem ipsum dolor sit amet, consectetur adipisci ut labore et minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'ownerImgUrl': ImagePath.user4,
      'age': '3',
      'sex': 'Female',
      'color': 'Gold',
      'length': '2.0'
    },
    {
      'id': '3',
      'petname': 'Jon',
      'petDesc': 'vix ei, cu mea',
      'amount': '5500',
      'petImageUrl': ImagePath.dog3,
      'ownername': 'Vikram',
      'ownerDesc': 'At regione conclusionemque his, ius c Lorem ipsum dolor sit amet, consectetur adipisci ut labore et minim veniam, quis nostrud exercitation ullamco laboru corrumpit',
      'ownerImgUrl': ImagePath.user2,
      'age': '5',
      'sex': 'Male',
      'color': 'Black',
      'length': '5.5'
    },
    {
      'id': '4',
      'petname': 'Dumbo',
      'petDesc': 'petentium reformidans. Eu',
      'amount': '7250',
      'petImageUrl': ImagePath.dog5,
      'ownername': 'Rambo',
      'ownerDesc': 'ei, cu mea dictas evertitur iasdasda asd asd asd asd asdasdas da asdasf hdsgh shh fahsdf osdof iosdio fio oebat pri.',
      'ownerImgUrl': ImagePath.user1,
      'age': '2',
      'sex': 'Female',
      'color': 'Blue',
      'length': '1.5'
    },
  ];
}
