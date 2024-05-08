import 'package:flutter/cupertino.dart';
import 'package:presence_app/app/state/initialization/initialization_state.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:utopia_arch/utopia_arch.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(SplashScreen.new);

  @override
  Widget build(BuildContext context) {
    final initializationState = useProvided<InitializationState>();

    useEffect(() {
      if(initializationState.isInitialized) {
        // TODO Navigate to the next screen
      }
    }, [initializationState.isInitialized]);

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientSecondary,
      ),
    );
  }
}
