import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_care/common/utils/app_const.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/common/utils/image_string.dart';
import 'package:pet_care/pages/details_page/models/pet_details_model.dart';
import 'package:pet_care/pages/details_page/models/pet_list_model.dart';
import 'package:pet_care/pages/home_page/UI/pet_details_tile.dart';
import 'package:pet_care/pages/home_page/bloc/home_bloc.dart';
import 'package:pet_care/pages/home_page/UI/category_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool backPressed = false;

  late AnimationController controllerToIncreasingCurve = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  );

  late AnimationController controllerToDecreasingCurve = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  );

  late Animation<double> animationToIncreasingCurve = Tween<double>(begin: 1000, end: 0).animate(
    CurvedAnimation(
      parent: controllerToIncreasingCurve,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  );

  late Animation<double> animationToDecreasingCurve = Tween<double>(begin: 0, end: 1000).animate(
    CurvedAnimation(
      parent: controllerToDecreasingCurve,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  );

  @override
  void initState() {
    homeBlock.add(HomeInitialEvent());
    controllerToIncreasingCurve.addListener(() {
      setState(() {});
    });

    controllerToDecreasingCurve.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) => startAnimation());
  }

  Future<void> startAnimation() async {
    controllerToIncreasingCurve.forward();
  }

  @override
  void dispose() {
    controllerToIncreasingCurve.dispose();
    controllerToDecreasingCurve.dispose();
    super.dispose();
  }

  final HomeBloc homeBlock = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (pop) async {
        backPressed = true;
        await controllerToDecreasingCurve.forward();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          backPressed == false ? animationToIncreasingCurve.value : animationToDecreasingCurve.value,
        ),
        child: Scaffold(
          appBar: _homeAppbar(),
          backgroundColor: AppColors.white,
          body: BlocConsumer<HomeBloc, HomeState>(
            bloc: homeBlock,
            listenWhen: (previous, current) => current is HomeActionState,
            buildWhen: (previous, current) => current is! HomeActionState,
            listener: (context, state) {},
            builder: (context, state) {
              List<PetListModel> categoryLists = [];
              List<PetDetailsModel> petDetailsLists = [];

              if (state is ListLoddedSuccessState) {
                categoryLists = state.categoryList;
                petDetailsLists = state.petList;
              }

              return Container(
                width: AppConstants.screenWidth,
                height: AppConstants.screenHeight,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: AppColors.whiteLite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(75),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchContent(),
                      _CategoryList(categoryLists),
                      SizedBox(
                        height: 30,
                      ),
                      _PetDetailsList(petDetailsLists),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Expanded _PetDetailsList(List<PetDetailsModel> petDetailsLists) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: petDetailsLists.length,
        itemBuilder: (context, index) {
          PetDetailsModel item = petDetailsLists[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Pet_Details_Tile(
              bloc: homeBlock,
              petList: item,
            ),
          );
        },
      ),
    );
  }

  Container _CategoryList(List<PetListModel> categoryLists) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: AppConstants.screenWidth,
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          itemCount: categoryLists.length,
          itemBuilder: (context, index) {
            PetListModel item = categoryLists[index];
            return Category_Tile(
              bloc: homeBlock,
              categoryList: item,
            );
          }),
    );
  }

  AppBar _homeAppbar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        AppConst.appName.toUpperCase(),
        style: TextStyle(
          wordSpacing: 8,
          letterSpacing: 4,
          fontSize: 18,
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: CircleAvatar(backgroundImage: AssetImage(ImagePath.user3)),
        ),
      ],
    );
  }

  Column _searchContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConst.searchForPet,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 20,
        ),
        TextField(
          autocorrect: true,
          autofocus: false,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.black38,
            hintText: AppConst.search,
            hintStyle: TextStyle(color: Colors.black38, fontSize: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            fillColor: AppColors.white,
            filled: true,
            contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          ),
        ),
      ],
    );
  }
}
