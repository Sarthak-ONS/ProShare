import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthApi {
  static final _googleSignIn = GoogleSignIn();

  Future loginWithGoogle() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      GoogleSignInAuthentication auth = await account!.authentication;
      if (await _googleSignIn.isSignedIn()) {
        print(account.email);
        return;
      }
      print(account.email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    try {
      _googleSignIn.signOut();
      return true;
    } catch (e) {
      return null;
    }
  }
}
