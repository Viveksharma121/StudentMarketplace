import 'package:classico/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _print);
  }

  _print(User? user) {
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      print("Logged in");
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? print("not null ")
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      //  final ex=SignUpWithEmailAndPasswordFailure.code(e.code);
      print('fire base auth error - ${e.message}');
      //  throw ex;
    } catch (_) {}
  }
}
