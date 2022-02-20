import 'package:eticaret/models/facebook.model.dart';
import 'package:eticaret/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  bool rememberMe = false;
  var displayName = ''.obs;
  var displayUserEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FacebookModel? facebookModel;
  var googleSignIn = GoogleSignIn();
  var displayPhotoUser = ''.obs;
  bool isLogin = false;
  GetStorage authStorage = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    googleSignUpApp();
    displayName.value = userProfile != null ? userProfile!.displayName! : '';
    displayPhotoUser.value = userProfile != null ? userProfile!.photoURL! : '';
    displayUserEmail.value = userProfile != null ? userProfile!.email! : '';
  }

  void authLoginStorage(bool login, String key) {
    login = true;
    authStorage.write(key, login);
  }

  void visibility() {
    isVisibility = !isVisibility;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void remember() {
    rememberMe = !rememberMe;
    update();
  }

  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      authLoginStorage(true, 'auth');

      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code;
      String message = '';
      if (e.code == 'Şifre uyarısı') {
        message =
            'Girilen şifre güvenlik açısından yetersizdir.Lütfen güvenli şifre giriniz.';
      } else if (e.code == 'Email uyarısı') {
        message = 'Email adresiniz sistemde kayıtlıdır.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayName.value = auth.currentUser!.displayName!);
      authLoginStorage(true, 'auth');
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = '';
      String message = '';
      if (e.code == 'Kullanıcı bulunamadı') {
        message = 'Bu email e ait kullanıcı bulunamadı.';
      } else if (e.code == 'Hatalı işlem') {
        message = 'Şifre veya email hatalıdır';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void googleSignUpApp() async {
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayName.value = googleUser!.displayName!;
      displayPhotoUser.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;
      /* GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await auth.signInWithCredential(credential); */

      authLoginStorage(true, 'auth');

      update();
      Get.offNamed(Routes.mainScreen);
      Get.snackbar(
        'Google',
        'Google ile giriş başarılı',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void facebookSignUpApp() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final data = await FacebookAuth.instance.getUserData();
        facebookModel = FacebookModel.fromJson(data);
        debugPrint(facebookModel!.email.toString());
        debugPrint(facebookModel!.name.toString());

        authLoginStorage(true, 'auth');
        update();
        Get.offNamed(Routes.mainScreen);
        Get.snackbar(
          'Facebook',
          'Facebook ile giriş başarılı',
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = '';
      String message = '';
      if (e.code == 'Kullanıcı bulunamadı') {
        message = 'Bu email e ait kullanıcı bulunamadı.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayName.value = '';
      displayPhotoUser.value = '';
      displayUserEmail.value = '';
      isLogin = false;
      authStorage.remove('auth');
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
