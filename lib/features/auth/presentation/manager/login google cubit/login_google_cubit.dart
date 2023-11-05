import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_google_state.dart';

class LoginGoogleCubit extends Cubit<LoginGoogleState> {
  LoginGoogleCubit() : super(LoginGoogleInitial());

  Future signInWithGoogle() async {
    try {
      emit(LoginGoogleLoading());
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(LoginGoogleFailure(errorMessage: 'uncomplement login, try again'));
        return;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      emit(LoginGoogleSuccess());
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      emit(LoginGoogleFailure(errorMessage: e.toString()));
    }
  }
}
