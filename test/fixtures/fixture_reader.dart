import 'dart:io';

String getFixutre(String name) =>
    File('test/fixtures/$name').readAsStringSync();
