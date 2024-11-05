import 'dart:convert';

import '../lib/service/item_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

void main() {
  group('ItemService', () {
    test('fetchAndFilterItems retorna lista filtrada', () async {
      final client = MockClient((request) async {
        return http.Response(
          jsonEncode([
            {'name': 'Item A'},
            {'name': 'Item B'},
            {'name': 'Teste Item C'}
          ]),
          200,
        );
      });

      final itemService = ItemService('https://fakeapi.com/items', client: client);

      final result = await itemService.fetchAndFilterItems('Teste');
      expect(result, ['Teste Item C']);
    });
  });
}
