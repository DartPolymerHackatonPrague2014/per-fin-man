// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:convert';

@CustomTag('add-element')
class Add extends PolymerElement {
  
  Add.created() : super.created();
  
  ready() {
    super.ready();
    //querySelector('#date_input').text = '11/11/2011';
  }

}
