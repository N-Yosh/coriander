import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coriander/domain/book.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBookToFirebase() {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    FirebaseFirestore.instance.collection('books').add({
      'title': bookTitle,
      'createdAt': Timestamp.now(),
    });
  }

  Future updateBook(Book book) {
    final doc =
        FirebaseFirestore.instance.collection('books').doc(book.documentID);
    doc.update({
      'title': bookTitle,
      'updateAt': Timestamp.now(),
    });
  }
}
