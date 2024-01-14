import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getTable(String tableName) async {
  final response = await http.get(Uri.parse('http://localhost:3000/$tableName'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
