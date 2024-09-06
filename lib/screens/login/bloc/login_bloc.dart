import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hn_market/main/bloc/main_bloc.dart';

import '../../../utils/utils.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final void Function(bool isLoggedIn)? onResult;
  LoginBloc(this.onResult) : super(const LoginState()) {
    on<LoginWithGoogle>(loginWithGoogle);
  }
  loginWithGoogle(LoginWithGoogle event, Emitter<LoginState> emit) async {
    try {
      EasyLoading.show();
      await signInWithGoogle().then((value) {
        onResult?.call(true);
        Utils.mainBloc.add(const ChangeLogin(true));
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
      GoogleSignIn().signOut();
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ['profile', 'email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
