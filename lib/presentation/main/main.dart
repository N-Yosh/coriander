import 'package:coriander/login/login_page.dart';
import 'package:coriander/presentation/book_list/book_list_page.dart';
import 'package:coriander/signup/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_model.dart';

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
                      child: Text('新規登録'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>SIgnUpPage())
                        );
                      },
                    ),
                    RaisedButton(
                      child: Text('ログイン'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>LoginPage())
                        );
                      },
                    ),
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
