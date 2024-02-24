import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_care/common/utils/app_const.dart';
import 'package:pet_care/common/utils/colors.dart';
import 'package:pet_care/common/utils/image_string.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  final cardSize = 180.0;

  late final cardOffsetAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final holeSizeTween = Tween<double>(
    begin: 0,
    end: 1.5 * cardSize,
  );

  late final holeAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  double get holeSize => holeSizeTween.evaluate(holeAnimationController);

  @override
  void initState() {
    initAnimation();
    holeAnimationController.addListener(() => setState(() {
          // if (holeAnimationController.isCompleted) Future.delayed(const Duration(milliseconds: 400), () => holeAnimationController.reverse());
        }));
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
            Spacer(),
            Container(
              height: cardSize * 1.25,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: holeSize,
                      child: Image.asset(
                        ImagePath.hole,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -50),
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            ImagePath.logo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
