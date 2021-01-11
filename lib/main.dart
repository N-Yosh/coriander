import 'package:coriander/book_list_page.dart';
import 'package:coriander/main_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_)=>MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('コリアンダー'),
          ),
          body: Consumer<MainModel>(
            builder: (context,model, child) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      model.text,
                      style: TextStyle(fontSize: 30),
                    ),
                    RaisedButton(
                      child: Text('Button'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>BookListPage())
                        );
                      },
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
