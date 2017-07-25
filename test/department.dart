@TestOn("dart-vm")

import 'package:test/test.dart';
import 'package:DartAngular2SmartTable/smart_table_component.dart';

void main() {
  group('getters\' tests', () {
    Department department = new Department('Russia dept.');

    test('get name field', () {
      expect(department.name, 'Russia dept.');
    });
  });

  group('setters\' tests', () {
    Department department = new Department('Russia dept.');

    department.name = 'Italy dept.';

    test('set name field', () {
      expect(department.name, 'Italy dept.');
    });
  });

  group('other tests', () {
    Department department = new Department('Russia dept.');

    test('toString()', () {
      expect(department.toString(), 'Russia dept.');
    });
  });
}