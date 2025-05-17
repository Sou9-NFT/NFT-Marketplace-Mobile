import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'affichage_artwork_trade_test_model.dart';
export 'affichage_artwork_trade_test_model.dart';

class AffichageArtworkTradeTestWidget extends StatefulWidget {
  const AffichageArtworkTradeTestWidget({super.key});

  static String routeName = 'Affichage_Artwork_trade_test';
  static String routePath = '/affichageArtworkTradeTest';

  @override
  State<AffichageArtworkTradeTestWidget> createState() =>
      _AffichageArtworkTradeTestWidgetState();
}

class _AffichageArtworkTradeTestWidgetState
    extends State<AffichageArtworkTradeTestWidget> {
  late AffichageArtworkTradeTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AffichageArtworkTradeTestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'ARTWORK TEST TRADE',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: FlutterFlowTheme.of(context).headlineMedium,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(MainHomePageWidget.routeName);
                    },
                    text: 'Return',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: FlutterFlowTheme.of(context).titleSmall,
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<ArtworkTradeTestRecord>>(
            stream: queryArtworkTradeTestRecord(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ArtworkTradeTestRecord> columnArtworkTradeTestRecordList =
                  snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(columnArtworkTradeTestRecordList.length,
                    (columnIndex) {
                  final columnArtworkTradeTestRecord =
                      columnArtworkTradeTestRecordList[columnIndex];
                  return Text(
                    columnArtworkTradeTestRecord.title,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: FlutterFlowTheme.of(context).bodyMedium,
                          letterSpacing: 0.0,
                        ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
