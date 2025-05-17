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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> unlockBadge(
  int badgeId,
  String counterField,
  int threshold,
) async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) return;

  final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
  final doc = await userRef.get();

  if (!doc.exists) return;

  final data = doc.data();
  if (data == null) return;

  final dynamic countValue = data[counterField];
  if (countValue is! int || countValue < threshold) return;

  final List<dynamic> unlocked = data['unlocked_badges'] ?? [];
  if (unlocked.contains(badgeId)) return;

  unlocked.add(badgeId);
  await userRef.update({'unlocked_badges': unlocked});
}
