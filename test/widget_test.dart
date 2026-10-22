import 'package:flutter_test/flutter_test.dart';
import 'package:product_profile_app/main.dart';

void main() {
  testWidgets('Aplikasi Product Profile berhasil ditampilkan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProductProfileApp());

    expect(find.text('Fikri Zakaria'), findsOneWidget);
    expect(find.text('Headphone Bluetooth'), findsOneWidget);
    expect(find.text('Tambah ke Keranjang'), findsOneWidget);
  });
}