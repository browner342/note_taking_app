import 'dart:convert';
import 'dart:io';

/// Class LocalFileManager
/// Handle local files especially JSON fromat
class LocalFileManager {
  LocalFileManager(this.path);
  final path;

  /// Function _localFile
  /// Returns File
  /// It allows to write or read
  Future<File> _localFile(String id) async {
    return File('$path/$id.json');
  }

  /// Function writeAsJson
  /// Take Map => json
  /// Write it to the file
  /// Returns file
  Future<File> writeAsJson(Map json, String id) async {
    final file = await _localFile(id);

    // Encoding map(Json) to string
    final jsonString = jsonEncode(json);

    // Write the file.
    return file.writeAsString(jsonString);
  }

  /// Function readJson
  /// Read the file
  /// Returns Map => Json
  /// If fail return empty Map
  Future<Map> readJson(String id) async {
    try {
      final file = await _localFile(id);

      // Read the file.
      String contents = await file.readAsString();

      return json.decode(contents);
    } catch (e) {
      // If encountering an error, return {}.
      print(e);
      return null;
    }
  }

  Future<bool> deleteFile(String id) async {
    try {
      final file = await _localFile(id);

      await file.delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
