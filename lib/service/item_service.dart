import 'dart:convert';
import 'package:http/http.dart' as http;

class ItemService {
  final String apiUrl;
  final http.Client client;

  ItemService(this.apiUrl, {http.Client? client}) : client = client ?? http.Client();

  Future<List<String>> fetchAndFilterItems(String filter) async {
    final response = await client.get(Uri.parse(apiUrl)); 
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .where((item) => item['name'].contains(filter))
          .map<String>((item) => item['name'])
          .toList();
    } else {
      throw Exception('Erro ao carregar itens');
    }
  }
}
