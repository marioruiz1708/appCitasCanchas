import 'package:agendamiento_canchas/provider/db_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DBProvider Tests', () {
    testWidgets('Inicialización de la base de datos',
        (WidgetTester tester) async {
      // Configurar el entorno de Flutter para la prueba
      await tester.runAsync(() async {
        final dbProvider = DBProvider.db;
        final database = await dbProvider.initDB();
        expect(database, isNotNull);
      });
    });
  });
}
