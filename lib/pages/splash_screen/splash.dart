import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_care/common/utils/app_const.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/common/utils/image_string.dart';
import 'package:pet_care/common/widgets/black_hole_clipper.dart';
import 'package:pet_care/common/widgets/custom_page_transition.dart';
import 'package:pet_care/pages/home_page/home.dart';
import 'package:pet_care/pages/splash_screen/bloc/splash_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  /****************** TWEEN ************************/

  late final holeSizeTween = Tween<double>(
    begin: 0,
    end: 1.5 * AppConstants.screenWidth * 0.65,
  );

  late final cardRotationTween = Tween<double>(
    begin: 0.95,
    end: 0,
  );

  late final cardOffsetTween = Tween<double>(
    begin: 12,
    end: 0,
  ).chain(CurveTween(curve: Curves.easeInOutBack));

  late final opacityTween = Tween<double>(
    begin: 0,
    end: 1,
  ).chain(CurveTween(curve: Curves.easeInOut));

  late final headerPoitionTween = CurvedAnimation(parent: opacityAnimationController, curve: Curves.linear);

  /****************** CONTROLLER ************************/

  late final holeAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  late final cardOffsetAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );

  late final opacityAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  /****************** CONTROLLER ************************/

  double get holeSize => holeSizeTween.evaluate(holeAnimationController);
  double get cardRotation => cardRotationTween.evaluate(cardOffsetAnimationController);
  double get cardOffset => cardOffsetTween.evaluate(cardOffsetAnimationController);
  double get opacity => opacityTween.evaluate(opacityAnimationController);

  @override
  void initState() {
    startAnimation();
    holeAnimationController.addListener(() => setState(() {}));
    cardOffsetAnimationController.addListener(() => setState(() {
          if (cardOffset < 4) {
            opacityAnimationController.forward();
          }
        }));
    opacityAnimationController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    holeAnimationController.dispose();
    cardOffsetAnimationController.dispose();
    opacityAnimationController.dispose();
    super.dispose();
  }

  Future<void> startAnimation() async {
    holeAnimationController.forward();
    await cardOffsetAnimationController.forward();
    holeAnimationController.reverse();
  }

  final SplashBloc homeBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: BlocConsumer<SplashBloc, SplashState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is SplashActionState,
        buildWhen: (previous, current) => current is! SplashActionState,
        listener: (context, state) {
          if (state is HomeScreenNavigation) {
            Navigator.of(context).push(
              MyCustomAnimatedRoute(
                route: HomePage(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              _headerWidget(context),
              Spacer(),
              _bodyWidget(),
              Spacer(
                flex: 2,
              ),
              _footerWidget(context, state),
              Spacer(
                flex: 2,
              ),
            ],
          );
        },
      ),
    );
  }

  AnimatedOpacity _footerWidget(BuildContext context, SplashState state) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1500),
      opacity: opacity,
      child: ElevatedButton(
        onPressed: () {
          homeBloc.add(NavigateToHomeScreen());
        },
        child: AnimatedCrossFade(
            duration: Duration(milliseconds: 500),
            crossFadeState: state is loadinBtnState ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: Text(
              AppConst.splashBtnText.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            secondChild: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              ),
              height: 20.0,
              width: 20.0,
            )),
      ),
    );
  }

  Widget _bodyWidget() {
    return Center(
      child: ClipPath(
        clipper: BlackHoleClipper(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: holeSize,
                child: Image.asset(
                  ImagePath.hole,
                  height: holeSize / 6.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, cardOffset * 15),
              child: Transform.rotate(
                angle: cardRotation,
                child: Image.asset(
                  ImagePath.logo,
                  width: AppConstants.screenWidth * 0.8,
                  height: AppConstants.screenWidth * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Opacity _headerWidget(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        margin: EdgeInsets.only(top: 50 * (1 - headerPoitionTween.value)),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppConst.splashTitleText,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppConst.splashSubTitleText,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
