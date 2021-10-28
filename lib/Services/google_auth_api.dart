import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro_share/Provider/user_data.dart';
import 'package:provider/provider.dart';

class GoogleAuthApi {
  static final _googleSignIn = GoogleSignIn();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> loginWithGoogle(context) async {
    // _googleSignIn.signOut();
    // _firebaseAuth.signOut();
    // return false;
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      GoogleSignInAuthentication auth = await account!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken!,
        idToken: auth.idToken,
      );
      if (await _googleSignIn.isSignedIn()) {
        await _firebaseAuth.signInWithCredential(credential);
        Provider.of<UserData>(context, listen: false).changeUserDetails(
          _firebaseAuth.currentUser!.displayName,
          _firebaseAuth.currentUser!.photoURL,
          _firebaseAuth.currentUser!.email,
          _firebaseAuth.currentUser!.uid,
        );
        return true;
      }
      print(_firebaseAuth.currentUser!.uid);
      await _firebaseAuth.signInWithCredential(credential);
      Provider.of<UserData>(context, listen: false).changeUserDetails(
        _firebaseAuth.currentUser!.displayName,
        _firebaseAuth.currentUser!.photoURL,
        _firebaseAuth.currentUser!.email,
        _firebaseAuth.currentUser!.uid,
      );
      return true;
    } catch (e) {
      return false;
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
