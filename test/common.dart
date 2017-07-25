@TestOn("dart-vm")

import 'package:test/test.dart';
import 'package:DartAngular2SmartTable/smart_table_component.dart';

void main() {
    Department department = new Department('Russia dept.');
    Address address = new Address('Moscow', 'Fuchika str.', '12F');
    SmartTableRecord smartTableRecord =
        new SmartTableRecord('Sergei', 28, Sex.male(), department, address);

    test('getProperty for non-nested property', () {
      expect(getProperty(smartTableRecord, 'age').reflectee
          .toString(), '28');
    });

    test('getProperty for nested property', () {
      expect(getProperty(smartTableRecord, 'department.name').reflectee
          .toString(), 'Russia dept.');
    });

    test('getProperty for non-existed non-nested property', () {
      try {
        expect(getProperty(smartTableRecord, 'nonExisted').reflectee
            .toString(), 'nonExistedValue');
      } on NoSuchMethodError {
        expect(true, true);
      }
    });

    test('getProperty for non-existed nested property', () {
      try {
        expect(getProperty(smartTableRecord, 'department.nonExisted').reflectee
            .toString(), 'nonExistedValue');
      } on NoSuchMethodError {
        expect(true, true);
      }
    });
}