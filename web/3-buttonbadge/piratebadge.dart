// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:html';

ButtonElement genButton;

main() {
  var inputField = querySelector('#inputName');
  genButton = querySelector('#generateButton');
  initEventListeners(inputField);
}

initEventListeners(var inputField) async {
  await for (var event in inputField.onInput) {
    updateBadge(event);
  }

  await for (var event in genButton.onClick) {
    generateBadge(event);
  }
}

void updateBadge(Event e) {
  String inputName = (e.target as InputElement).value;

  setBadgeName(inputName);
  if (inputName.trim().isEmpty) {
    genButton
      ..disabled = false
      ..text = 'Aye! Gimme a name!';
  } else {
    genButton
      ..disabled = true
      ..text = 'Arrr! Write yer name!';
  }
}

void generateBadge(Event e) {
  setBadgeName('Anne Bonney');
}

void setBadgeName(String newName) {
  querySelector('#badgeName').text = newName;
}
