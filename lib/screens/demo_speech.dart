import 'package:flutter/material.dart';
import 'dart:async';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import '../widgets/prescription_items.dart';
// import 'package:speech_to_text/speech_recognition_error.dart';

class DemoSpeech extends StatefulWidget {
  @override
  _DemoSpeechState createState() => _DemoSpeechState();
}

class _DemoSpeechState extends State<DemoSpeech> {
  bool _expanded = false;
  String dummy = "";
  bool _hasSpeech = false;
  String titleWords = "";
  String lastWords = "";
  // String lastError = "";
  String lastStatus = "";
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
      // onError: errorListener,
      onStatus: statusListener,
    );

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to Text Example'),
      ),
      body: _hasSpeech
          ? Column(
              children: [
                // Expanded(
                //   child: Column(
                //     children: <Widget>[
                //       Center(
                //         child: Text('Recognized Words'),
                //       ),
                //       Center(
                //         child: Text(lastWords),
                //       ),
                //     ],
                //   ),
                // ),

                // Card(
                //   margin: const EdgeInsets.all(10),
                //   child: Column(
                //     children: <Widget>[
                //       ListTile(
                //         title: Text('Name'),
                //         trailing: IconButton(
                //           icon: Icon(_expanded
                //               ? Icons.expand_less
                //               : Icons.expand_more),
                //           onPressed: () {
                //             setState(() {
                //               _expanded = !_expanded;
                //             });
                //           },
                //         ),
                //       ),
                //       if (_expanded)
                //         Container(
                //           padding: const EdgeInsets.all(10),
                //           child: Text(lastWords),
                //         ),
                //     ],
                //   ),
                // ),
                PrescriptionItem(
                  lastWords: lastWords,
                  expanded: _expanded,
                  title: "Name",
                ),
                PrescriptionItem(
                  lastWords: lastWords,
                  expanded: _expanded,
                  title: "Symptoms",
                ),
                PrescriptionItem(
                  lastWords: lastWords,
                  expanded: _expanded,
                  title: "Diagnosis",
                ),
                PrescriptionItem(
                  lastWords: lastWords,
                  expanded: _expanded,
                  title: "Prescription",
                ),
                PrescriptionItem(
                  lastWords: lastWords,
                  expanded: _expanded,
                  title: "Advice",
                ),
                // Expanded(
                //   child: Center(
                //     child: Text('Speech recognition available'),
                //   ),
                // ),
                Expanded(
                  child: Center(
                    child: Text(lastWords.length.toString()),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text('Start'),
                        onPressed: startListening,
                      ),
                      // FlatButton(
                      //   child: Text('Stop'),
                      //   onPressed: stopListening,
                      // ),
                      // FlatButton(
                      //   child: Text('Cancel'),
                      //   onPressed: cancelListening,
                      // ),
                    ],
                  ),
                ),

                // Expanded(
                //   child: Column(
                //     children: <Widget>[
                //       Center(
                //         child: Text('Error'),
                //       ),
                //       Center(
                //         child: Text(lastError),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Center(
                    child: speech.isListening
                        ? Text("I'm listening...")
                        : Text('Not listening'),
                  ),
                ),
              ],
            )
          : Center(
              child: Text('Speech recognition unavailable',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
    );
  }

  void startListening() {
    lastWords = "";
    // lastError = "";
    speech.listen(onResult: resultListener);
    setState(() {});
  }

  // void stopListening() {
  //   speech.stop();
  //   setState(() {});
  // }

  // void cancelListening() {
  //   speech.cancel();
  //   setState(() {});
  // }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} "; // - ${result.finalResult}";
      // print('found words:  $lastWords');
      if (lastWords.isNotEmpty) {
        _expanded = true;
      }
    });
  }

  // void errorListener(SpeechRecognitionError error) {
  //   setState(() {
  //     lastError = "${error.errorMsg} - ${error.permanent}";
  //   });
  // }

  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";
    });
  }
}
