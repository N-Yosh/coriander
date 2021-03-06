import 'package:coriander/add_book/add_book_page.dart';
import 'package:coriander/domain/book.dart';
import 'book_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(builder: (context, model, child) {
          final books = model.books;
          final listTils = books
              .map(
                (book) => ListTile(
                  title: Text(book.title),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddBookPage(
                            book: book,
                          ),
                        ),
                      );
                      model.fetchBooks();
                    },
                  ),
                  onLongPress: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('${book.title}を削除しますか？'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () async {
                                Navigator.of(context).pop();
                                await deleteBook(model, book, context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              )
              .toList();
          return ListView(
            children: listTils,
          );
        }),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                ),
              );
              model.fetchBooks();
            },
          );
        }),
      ),
    );
  }

  Future deleteBook(
      BookListModel model, Book book, BuildContext context) async {
    try {
      await model.deleteBook(book);
      await model.fetchBooks();
    } catch (e) {
      await _showDialog(context, e.toString());
    }
  }

  Future _showDialog(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
