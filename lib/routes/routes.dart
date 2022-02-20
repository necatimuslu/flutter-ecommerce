import 'package:eticaret/logic/binding/auth_binding.dart';
import 'package:eticaret/logic/binding/category_binding.dart';
import 'package:eticaret/logic/binding/main_binding.dart';
import 'package:eticaret/logic/binding/product_binding.dart';

import 'package:eticaret/view/screens/auth/forgot_password_screen.dart';
import 'package:eticaret/view/screens/auth/login_screen.dart';
import 'package:eticaret/view/screens/auth/signup_screen.dart';
import 'package:eticaret/view/screens/payment_screen.dart';
import 'package:eticaret/view/widgets/cart_screen.dart';

import 'package:eticaret/view/screens/main_screen.dart';

import 'package:eticaret/view/screens/welcome_secreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class AppRoutes {
  static const welcomeScreen = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  static var initialRouteControl = FirebaseAuth.instance.currentUser != null ||
          GetStorage().read<bool>('auth') == true
      ? Routes.mainScreen
      : Routes.welcomeScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
        CategoryBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => const PaymentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
