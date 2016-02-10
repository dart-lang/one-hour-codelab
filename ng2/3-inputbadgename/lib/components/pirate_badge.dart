// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';

@Component(
    selector: 'pirate-badge',
    templateUrl: 'pirate_badge.html')
class PirateBadge {
  String badgeName = "";

  void updateBadge(String inputName) {
    badgeName = inputName.toString();
  }
}