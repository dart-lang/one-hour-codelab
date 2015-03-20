// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math' show Random;

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

  setBadgeName(new PirateName(firstName: inputName));
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
  setBadgeName(new PirateName());
}

void setBadgeName(PirateName newName) {
  querySelector('#badgeName').text = newName.pirateName;
}

class PirateName {
  static final Random indexGen = new Random();

  String _firstName;
  String _appellation;

  PirateName({String firstName, String appellation}) {
    if (firstName == null) {
      _firstName = names[indexGen.nextInt(names.length)];
    } else {
      _firstName = firstName;
    }
    if (appellation == null) {
      _appellation = appellations[indexGen.nextInt(appellations.length)];
    } else {
      _appellation = appellation;
    }
  }

  String toString() => pirateName;

  String get pirateName =>
      _firstName.isEmpty ? '' : '$_firstName the $_appellation';

  static final List names = [
    'Anne',
    'Mary',
    'Jack',
    'Morgan',
    'Roger',
    'Bill',
    'Ragnar',
    'Ed',
    'John',
    'Jane'
  ];
  static final List appellations = [
    'Jackal',
    'King',
    'Red',
    'Stalwart',
    'Axe',
    'Young',
    'Brave',
    'Eager',
    'Wily',
    'Zesty'
  ];
}
