import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/app_const.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/constants.dart';
import 'package:pet_care/common/utils/image_string.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  final cardSize = 150.0;

  /****************** TWEEN ************************/

  late final holeSizeTween = Tween<double>(
    begin: 0,
    end: 1.5 * cardSize,
  );

  late final cardRotationTween = Tween<double>(
    begin: 0.95,
    end: 0,
  );

  late final cardOffsetTween = Tween<double>(
    begin: 12,
    end: 0,
  ).chain(CurveTween(curve: Curves.easeInOutBack));

  /****************** CONTROLLER ************************/

  late final holeAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  late final cardOffsetAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );

  double get holeSize => holeSizeTween.evaluate(holeAnimationController);
  double get cardRotation => cardRotationTween.evaluate(cardOffsetAnimationController);
  double get cardOffset => cardOffsetTween.evaluate(cardOffsetAnimationController);

  @override
  void initState() {
    initAnimation();
    holeAnimationController.addListener(() => setState(() {}));
    cardOffsetAnimationController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    holeAnimationController.dispose();
    super.dispose();
  }

  Future<void> initAnimation() async {
    holeAnimationController.forward();
    await cardOffsetAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 300), () => holeAnimationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Spacer(),
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
              height: 25,
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
            Spacer(),
            Container(
              height: cardSize * 1.45,
              child: Center(
                child: SizedBox(
                  width: double.infinity,
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
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                print("hii");
              },
              child: Text(
                AppConst.splashBtnText.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class BlackHoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      0,
      pi,
      true,
    );
    // Using -1000 guarantees the card won't be clipped at the top, regardless of its height
    path.lineTo(0, -1000);
    path.lineTo(size.width, -1000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BlackHoleClipper oldClipper) => false;
}
