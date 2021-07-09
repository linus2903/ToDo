import 'package:flutter/material.dart';

class CardData {
  static var cardList = <Map>[
    {'text': "karte1", 'color': Colors.red[100], 'erledigt': false},
    {'text': "karte2", 'color': Colors.red[200], 'erledigt': false},
    {'text': "karte3", 'color': Colors.red[300], 'erledigt': false},
    {'text': "karte4", 'color': Colors.red[400], 'erledigt': false},
    {'text': "karte5", 'color': Colors.red[500], 'erledigt': false},
    {'text': "karte6", 'color': Colors.red[600], 'erledigt': false},
    {'text': "karte7", 'color': Colors.red[700], 'erledigt': false},
    {'text': "karte8", 'color': Colors.red[800], 'erledigt': false},
    {'text': "karte9", 'color': Colors.red[900], 'erledigt': false},
    {'text': "karte10", 'color': Colors.red, 'erledigt': false},
  ];
  //var getData = {'text': "karte1", 'color': Colors.black12, 'erledigt': false};

  void addCard(String text, Color color, bool erledigt) {
    //getData.addEntries('text': text, 'color': color, 'erledigt': erledigt);
    cardList.add({'text': text, 'color': color, 'erledigt': erledigt});
  }
}
