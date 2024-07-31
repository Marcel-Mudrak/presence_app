import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:presence_app/app/state/initialization/initialization_state.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_images.dart';
import 'package:presence_app/screen/main/main_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(SplashScreen.new);

  @override
  Widget build(BuildContext context) {
    final initializationState = useProvided<InitializationState>();

    useEffect(() async {
      if (initializationState.isInitialized) {
        await context.navigator.pushNamedAndReset(MainScreen.route);
      }
    }, [initializationState.isInitialized]);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientPrimary,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.logo,
              scale: 8,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: LoadingAnimationWidget.discreteCircle(
              color: AppColors.niceWhite,
              size: 100,
              secondRingColor: AppColors.niceBlue,
              thirdRingColor: AppColors.button,
            ),
          ),
        ],
      ),
    );
  }
}
