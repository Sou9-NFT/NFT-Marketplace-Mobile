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

import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html; // For web download
import 'dart:convert'; // For base64 encoding needed for web download link

// If you want to support mobile sharing/saving as well, uncomment these and add 'printing' to pubspec
// import 'package:printing/printing.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';

Future<void> generateAndDownloadRafflePdf(
  String title,
  String startTime,
  String endTime,
  String description,
  // List<String>? participantsList, // Optional: if you add this parameter
) async {
  final pdf = pw.Document();

  // Add a page
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Raffle Details',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.Text('Title: $title', style: pw.TextStyle(fontSize: 16)),
            pw.SizedBox(height: 10),
            pw.Text('Start Time: $startTime',
                style: pw.TextStyle(fontSize: 12)),
            pw.SizedBox(height: 10),
            pw.Text('End Time: $endTime', style: pw.TextStyle(fontSize: 12)),
            pw.SizedBox(height: 10),
            pw.Text('Description:',
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Text(description, style: pw.TextStyle(fontSize: 12)),
            pw.SizedBox(height: 20),

            // Optional: Display participants
            // if (participantsList != null && participantsList.isNotEmpty) ...[
            //   pw.Text('Participants:',
            //       style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            //   pw.SizedBox(height: 5),
            //   pw.ListView.builder(
            //     itemCount: participantsList.length,
            //     itemBuilder: (context, index) {
            //       return pw.Text('- ${participantsList[index]}');
            //     },
            //   ),
            // ],
          ],
        );
      },
    ),
  );

  // Save the PDF to bytes
  final Uint8List bytes = await pdf.save();

  // --- Web Download Logic ---
  // Create a blob from the bytes
  final blob = html.Blob([bytes], 'application/pdf');
  // Create an object URL from the blob
  final url = html.Url.createObjectUrlFromBlob(blob);
  // Create an anchor element
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download =
        'raffle_details_${title.replaceAll(' ', '_')}.pdf'; // Set a dynamic filename

  // Append to the body, click, and remove
  html.document.body!.children.add(anchor);
  anchor.click();
  html.document.body!.children.remove(anchor);
  html.Url.revokeObjectUrl(url);

  // --- Mobile Sharing/Saving Logic (Example using 'printing' package) ---
  // // This part requires the 'printing' and 'path_provider' packages
  // // Check if not on web (kIsWeb is a Flutter constant, true if running on web)
  // // You might need to import 'package:flutter/foundation.dart'; for kIsWeb
  // /*
  // if (!kIsWeb) { // kIsWeb needs: import 'package:flutter/foundation.dart'; at the top
  //   await Printing.sharePdf(bytes: bytes, filename: 'raffle_details_${title.replaceAll(' ', '_')}.pdf');
  //   // Or to save to a temporary file and then perhaps open it:
  //   // final outputDir = await getTemporaryDirectory();
  //   // final file = File("${outputDir.path}/raffle_details.pdf");
  //   // await file.writeAsBytes(bytes);
  //   // // You could then use 'open_file' package to open it, or just share it.
  // }
  // */
}
