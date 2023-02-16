import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {
  static signIn() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
