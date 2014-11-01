import 'dart:html';
import 'dart:convert' show JSON;

List<Category> categories = [];
List<Transaction> transactions = [];

void main() {

}

void saveCategories() {
  List<String> catStr;
  window.localStorage["categories"] = ""; 
}

void loadCategories() {
  String catStr = window.localStorage["categories"];
}

class Transaction {

  String note;
  DateTime date;
  num amount;
  num categoryId;

  Transaction(this.amount, this.date, this.note, this.categoryId);

  Transaction.fromJSON(String jsonString) {
    Map storedTransaction = JSON.decode(jsonString);
    this.note = storedTransaction['n'];
    this.date = storedTransaction['d'];
    this.amount = storedTransaction['a'];
    this.categoryId = storedTransaction['c'];
  }

  String get jsonString => JSON.encode({
    "n": this.note, 
    "d": this.date,
    "a": this.amount, 
    "c": this.categoryId});
}

class Category {
  
  String name;
  num id;
  
  Category(this.id, this.name);
  
  Category.fromJSON(String jsonString) {
    Map storedCategory = JSON.decode(jsonString);
    this.id = storedCategory['id'];
    this.name = storedCategory['n'];
  }
  
  String get jsonString => JSON.encode({
    "id": this.id,
    "n": this.name});
}
