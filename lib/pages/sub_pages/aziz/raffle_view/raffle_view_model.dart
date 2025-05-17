import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'raffle_view_widget.dart' show RaffleViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RaffleViewModel extends FlutterFlowModel<RaffleViewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Participate widget.
  UsersRecord? authUserDoc;
  // Stores action output result for [Backend Call - Read Document] action in Participate widget.
  RafflesRecord? currentRaffleDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
