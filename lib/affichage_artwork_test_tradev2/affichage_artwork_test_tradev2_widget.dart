import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'affichage_artwork_test_tradev2_model.dart';
export 'affichage_artwork_test_tradev2_model.dart';

class AffichageArtworkTestTradev2Widget extends StatefulWidget {
  const AffichageArtworkTestTradev2Widget({
    super.key,
    this.tradevisibility,
  });

  final bool? tradevisibility;

  static String routeName = 'affichage_artwork_test_tradev2';
  static String routePath = '/affichageArtworkTestTradev2';

  @override
  State<AffichageArtworkTestTradev2Widget> createState() =>
      _AffichageArtworkTestTradev2WidgetState();
}

class _AffichageArtworkTestTradev2WidgetState
    extends State<AffichageArtworkTestTradev2Widget> {
  late AffichageArtworkTestTradev2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AffichageArtworkTestTradev2Model());

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
                  'Affichage Artworks Test',
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
                    text: 'Close',
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
                  return Expanded(
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        Text(
                          columnArtworkTradeTestRecord.title,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                letterSpacing: 0.0,
                              ),
                        ),
                        if (currentUserUid !=
                            columnArtworkTradeTestRecord.ownedId?.id)
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  CreateTradeOfferWidget.routeName,
                                  queryParameters: {
                                    'receivedArtworkRef': serializeParam(
                                      columnArtworkTradeTestRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                    'receiverUserRef': serializeParam(
                                      columnArtworkTradeTestRecord.ownedId,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Trade',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
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
