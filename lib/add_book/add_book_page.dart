import 'add_book_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本追加'),
        ),
        body: Consumer<AddBookModel>(builder: (context, model, child) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  onChanged: (text) {
                    model.bookTitle = text;
                  },
                ),
                RaisedButton(
                    child: Text('追加する'),
                    onPressed: () async {
                      try {
                        await model.addBookToFirebase();

                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('追加しました'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        Navigator.of(context).pop();
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(e.toString()),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
