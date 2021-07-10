import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class CardData {
  static var cardList = <Map>[
    {'text': "karte1", 'color': Colors.red[100], 'erledigt': false},
    {'text': "karte2", 'color': Colors.red[200], 'erledigt': false},
    {'text': "karte3", 'color': Colors.red[300], 'erledigt': false},
    {'text': "karte4", 'color': Colors.red[400], 'erledigt': false},
    {'text': "karte5", 'color': Colors.red[500], 'erledigt': false},
  ];
  //var getData = {'text': "karte1", 'color': Colors.black12, 'erledigt': false};

  void addCard(String text, Color color, bool erledigt) {
    //getData.addEntries('text': text, 'color': color, 'erledigt': erledigt);
    cardList.add({'text': text, 'color': color, 'erledigt': erledigt});
  }
}

class ListStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/tododata.txt');
  }

  Future<List> readList() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return json.decode(contents) as List;
    } catch (e) {
      // If encountering an error, return 0
      return [
        {"fehler": "error"}
      ];
    }
  }

  Future<File> writeList(List kartendata) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$kartendata');
  }
}