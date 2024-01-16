import 'dart:convert';
import 'package:agendamiento_canchas/services/api_weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  group('Weather API Tests', () {
    testWidgets('API retorna datos correctamente', (WidgetTester tester) async {
      final mockClient = MockClient((request) async {
        // Simular la respuesta exitosa de la API
        return Response(
          json.encode({
            // Reemplaza con datos de respuesta simulados
            'exampleField': 'exampleValue',
          }),
          200,
        );
      });

      // Utilizar el cliente mock en lugar del cliente http real
      final weatherData = await apiWeather(
        null, // Puedes pasar null para el contexto en las pruebas
        '2024-01-016', // Reemplaza con la fecha deseada
        client: mockClient,
      );

      // Verificar que los datos obtenidos sean los esperados
      expect(weatherData, isNotNull);
      expect(weatherData.temperature, 0.0);
    });

    testWidgets('API maneja errores correctamente',
        (WidgetTester tester) async {
      final mockClient = MockClient((request) async {
        // Simular una respuesta de error desde la API
        return Response('Error en la respuesta de la API', 500);
      });

      // Probar la función apiWeather con el cliente mock
      final weatherData = await apiWeather(
        null, // Puedes pasar null para el contexto en las pruebas
        '2022-01-01', // Reemplaza con la fecha deseada
        client: mockClient,
      );

      // Verificar que apiWeather maneje correctamente el error
      expect(weatherData, isNull);
    });
  });
}
