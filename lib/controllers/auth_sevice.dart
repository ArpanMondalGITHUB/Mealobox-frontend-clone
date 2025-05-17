// import 'package:firebase_auth/firebase_auth.dart';

// class AuthSevice {
//   static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   static String verifyId = '';
//   // to sent the otp to user

//   static Future sendOtp(
//       {required Function errorstep,
//       required Function nextStep,
//       required String phoneNummber}) async {
//     await _firebaseAuth
//         .verifyPhoneNumber(
//       timeout: Duration(seconds: 30),
//       phoneNumber: '$phoneNummber',
//       verificationCompleted: (phoneAuthCredential) async {
//         return;
//       },
//       verificationFailed: (error) async {
//         return;
//       },
//       codeSent: (verificationId, forceResendingToken) async {
//         verifyId = verificationId;
//         nextStep();
//       },
//       codeAutoRetrievalTimeout: (verificationId) async {
//         return;
//       },
//     )
//         .onError(
//       (error, stackTrace) {
//         errorstep();
//       },
//     );
//   }

//   // verify the otp code

//   static Future loginwithOtp({required String otp}) async {
//     final cred =
//         PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);

//     try {
//       final user = await _firebaseAuth.signInWithCredential(cred);
//       if (user.user != null) {
//         return 'success';
//       } else {
//         return 'error in otp';
//       }
//     } on FirebaseAuthException catch (e) {
//       return e.message.toString();
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   // logout function

//   static Future logOut() async {
//     await _firebaseAuth.signOut();
//   }

//   // check the user is logedin or not

//   static Future<bool> islogIn() async {
//     var user = _firebaseAuth.currentUser;
//     return user != null;
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/showotpdialog.dart';

class AuthSevice {
  final FirebaseAuth _auth;
  AuthSevice(this._auth);

  Future<void> phoneSignIN(
    BuildContext context,
    String phonenumber,
  ) async {
    TextEditingController codeController = TextEditingController();
    await _auth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (error) {
        SnackBar(content: Text('data'));
      },
      codeSent: (String verificationId,int? forceResendingToken)async {
        showOTpDialog(
          codeController: codeController,
          context: context,
          onPressed: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: codeController.text.trim());
            await _auth.signInWithCredential(credential);
            Navigator.of(context).pop();
          },

        );
        
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        
      },
    );
  }
}
