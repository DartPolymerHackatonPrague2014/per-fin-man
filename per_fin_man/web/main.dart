import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:convert' show JSON;

@CustomTag('perfinman-app')
class PerFinManApp extends PolymerElement {
  @observable List transactions = toObservable([]);

  PerFinManApp.created() : super.created() {
  }

  ready() {
    $['newTransactionInput'].style.display = "none";
    if (window.localStorage.containsKey("transactions")) {
      loadTransactions();
    }
  }

  toggleDrawer() {
    $['drawerPanel'].togglePanel();
  }

  showNewTransactionInput() {
    $['newTransactionInput'].style.display = "block";
  }

  hideNewTransactionInput() {
    $['newTransactionInput'].style.display = "none";
    $['tran-amount'].value = "";
    $['tran-date'].value = " ";
    $['tran-note'].value = "";
  }
  
  void saveTransactions() {
    List<String> tranStr = new List();
    transactions.forEach((tr){
      tranStr.add(tr.jsonString);
    });
    window.localStorage["transactions"] = JSON.encode(tranStr); 
  }
  
  void loadTransactions() {
    String str = window.localStorage["transactions"];
    List<String> tranStr = JSON.decode(str);
    transactions = toObservable([]);
    tranStr.forEach((tr){
      transactions.add(new Transaction.fromJSON(tr));
    });
  }
  
  saveTransaction() {
    num amount = double.parse($['tran-amount'].value);
    bool type = $['tran-type'].checked;
    if (type == false) {
      amount=-amount;
    }
    String date = $['tran-date'].value;
    String note = $['tran-note'].value;
    Transaction tr = new Transaction(amount, date, note);
    transactions.add(tr);
    $['toast'].text="Transaction added";
    $['toast'].show();
    hideNewTransactionInput();
    //window.localStorage["transactions"] = tr.jsonString;
    saveTransactions();
  }
}

class Transaction {

  String note;
  String date;
  num amount;
  num categoryId;

  
  Transaction(this.amount, this.date, this.note);

  ///Load category from JSON
  Transaction.fromJSON(String jsonString) {
    Map storedTransaction = JSON.decode(jsonString);
    this.note = storedTransaction['n'];
    this.date = storedTransaction['d'];
    this.amount = storedTransaction['a'];
    this.categoryId = storedTransaction['c'];
  }

  ///Get JSON transaction
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
  
  ///Load category from JSON
  Category.fromJSON(String jsonString) {
    Map storedCategory = JSON.decode(jsonString);
    this.id = storedCategory['id'];
    this.name = storedCategory['n'];
  }
  
  ///Get JSON category
  String get jsonString => JSON.encode({
    "id": this.id,
    "n": this.name});
}
