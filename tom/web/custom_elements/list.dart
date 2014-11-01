// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:convert';

var data =     [
            [ "apple", 4, 10, 2 ],
            [ "banana", 0, 4, 0 ],
            [ "grape", 2, 3, 5 ],
            [ "pear", 4, 2, 8 ],
            [ "strawberry", 0, 14, 0 ]
        ];


@CustomTag('list-element')
class List extends PolymerElement {
  
  List.created() : super.created();

  ready() {
    super.ready();
  }

}
