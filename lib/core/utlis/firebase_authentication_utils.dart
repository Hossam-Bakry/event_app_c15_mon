import 'dart:developer';

import 'package:event_app_c15_mon/core/services/snackbar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthenticationUtils {
  static Future<bool> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      log(credential.user!.uid);

      SnackBarService.showSuccessMessage("Account Created Successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        SnackBarService.showErrorMessage(e.message ?? "Something went wrong");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        SnackBarService.showErrorMessage(e.message ?? "Something went wrong");
      }

      return Future.value(false);
    } catch (e) {
      print("---------------------");
      print(e);
      SnackBarService.showErrorMessage("Something went wrong");
      return Future.value(false);
    }
  }

  static Future<bool> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarService.showSuccessMessage("Logged In Successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SnackBarService.showErrorMessage(e.message ?? "Something went wrong");
      } else if (e.code == 'invalid-credential') {
        print('Wrong password provided for that user.');
        SnackBarService.showErrorMessage(e.message ?? "Something went wrong");
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      SnackBarService.showErrorMessage("Something went wrong");
      return Future.value(false);
    }
  }
}
