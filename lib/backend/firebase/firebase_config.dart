import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCVFSAmnnqrC3InuLEZyAGvp2NB68x8Zxs",
            authDomain: "sou9-nft.firebaseapp.com",
            projectId: "sou9-nft",
            storageBucket: "sou9-nft.firebasestorage.app",
            messagingSenderId: "296006357106",
            appId: "1:296006357106:web:b9462b2b0ae8ddec62f2eb"));
  } else {
    await Firebase.initializeApp();
  }
}
