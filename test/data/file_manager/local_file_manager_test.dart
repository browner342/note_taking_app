import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/data/file_manager/local_file_manager.dart';

void main() {
  LocalFileManager localFileManager;
  Directory directory;

  setUp(() {
    directory = Directory(
        'C:/Users/tom_pi/Documents/programming/Flutter/own/note_taking_app/test/fixtures');
    localFileManager = LocalFileManager(directory.path);
  });

  group('LocalFileManager class', () {
    test('should get path', () {
      print(directory.path);
      expect(localFileManager.path, directory.path);
    });

    test('should read data from a json file and return Map', () async {
      int id = 123;
      Map expectedMap = {"id": id, "modified_time": "23:23", "text": "test"};
      Map result = await localFileManager.readJson(id.toString());

      expect(result, expectedMap);
    });

    test('should add data to json file and return file', () async {
      int id = 124;
      Map jsonToWrite = {"id": id, "modified_time": "13:13", "text": "test2"};
      await localFileManager.writeAsJson(jsonToWrite, id.toString());

      Map result = await localFileManager.readJson(id.toString());

      expect(result, jsonToWrite);
    });

    test('when deleteFile is triggered and file exists should return true',
        () async {
      int id = 125;
      Map jsonToWrite = {"id": id, "modified_time": "15:13", "text": "test3"};
      await localFileManager.writeAsJson(jsonToWrite, id.toString());

      final result = await localFileManager.deleteFile(id.toString());

      expect(result, true);
    });

    test('when deleteFile is triggered and file not exists should return false',
        () async {
      int id = 126;

      final result = await localFileManager.deleteFile(id.toString());

      expect(result, false);
    });
  });
}
