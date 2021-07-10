
import 'package:flutter/material.dart';
import 'package:todo4/data.dart';
import 'package:todo4/main.dart';

class KarteHinzufuegen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KarteHinzufuegenState();
  }
}

class KarteHinzufuegenState extends State<KarteHinzufuegen> {
  final _formKey = GlobalKey<FormState>();
  String ueberschrift = "keine Überschrift verfügbar";


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo hinzufügen"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Überschrift'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    ueberschrift = value;
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                        CardData.cardList.add({
                          'text': ueberschrift,
                          'color': Colors.deepOrange,
                          'erledigt': false
                        });

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(title: "ToDoListe2", storage: ListStorage()),
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
