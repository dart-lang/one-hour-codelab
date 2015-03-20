// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:html';

main() {
  var inputName = querySelector('#inputName');
  initEventListeners(inputName);
}

initEventListeners(var inputName) async {
  await for (var event in inputName.onInput) {
    print(event);
    updateBadge(event);
  }
}

void updateBadge(Event e) {
  querySelector('#badgeName').text = (e.target as InputElement).value;
}
