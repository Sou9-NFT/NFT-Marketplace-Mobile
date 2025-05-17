// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // If directly using FirebaseAuth.instance

// If FlutterFlow provides authenticatedUser directly, you might not need the FirebaseAuth import explicitly for this part.
// However, for robustness and clarity:
Future<void> addUserToRaffle(String raffleId) async {
  // Get the current authenticated user
  final currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null) {
    // Handle the case where the user is not authenticated
    print('Error: User not authenticated. Cannot add to raffle.');
    // You might want to throw an error or return early,
    // or show a message to the user via another mechanism.
    return;
  }

  final String userId = currentUser.uid;

  // Get a reference to the user's document in the 'users' collection
  final DocumentReference userDocRef =
      FirebaseFirestore.instance.collection('users').doc(userId);

  try {
    // Update the 'RaffleJoined' list field by adding the new raffleId.
    // FieldValue.arrayUnion ensures the ID is only added if it's not already present,
    // preventing duplicates in the list.
    await userDocRef.update({
      'RaffleJoined': FieldValue.arrayUnion([raffleId]),
    });
    print(
        'Successfully added raffle ID $raffleId to RaffleJoined list for user $userId.');
  } catch (e) {
    print('Error updating RaffleJoined list for user $userId: $e');
    // You might want to handle this error more gracefully in your app,
    // e.g., by showing a snackbar message to the user.
  }
}
