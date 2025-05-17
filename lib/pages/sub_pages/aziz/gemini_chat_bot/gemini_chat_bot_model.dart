import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'gemini_chat_bot_widget.dart' show GeminiChatBotWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GeminiChatBotModel extends FlutterFlowModel<GeminiChatBotWidget> {
  ///  Local state fields for this page.

  String? chatBotResponse;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for promptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldTextController;
  String? Function(BuildContext, String?)?
      promptTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (TogetherAIChat)] action in Button widget.
  ApiCallResponse? apiResultxl5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptTextFieldFocusNode?.dispose();
    promptTextFieldTextController?.dispose();
  }
}
