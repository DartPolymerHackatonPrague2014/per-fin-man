import 'package:polymer/polymer.dart';

@CustomTag('perfinman-app')
class PerFinManApp extends PolymerElement {


  PerFinManApp.created() : super.created() {
  }

  ready() {
    $['newTransactionInput'].style.display = "none";
  }

  toggleDrawer() {
    $['drawerPanel'].togglePanel();
  }

  showNewTransactionInput() {
    $['newTransactionInput'].style.display = "block";
  }

  hideNewTransactionInput() {
    $['newTransactionInput'].style.display = "none";
  }
}
