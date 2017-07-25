@TestOn("dart-vm")

import 'package:test/test.dart';
import 'package:DartAngular2SmartTable/smart_table_component.dart';

void main() {
  group('getters\' tests', () {
    Address address = new Address('Moscow', 'Fuchika str.', '12F');

    test('get city field', () {
      expect(address.city, 'Moscow');
    });

    test('get street field', () {
      expect(address.street, 'Fuchika str.');
    });

    test('get building field', () {
      expect(address.building, '12F');
    });
  });

  group('setters\' tests', () {
    Address address = new Address('Moscow', 'Fuchika str.', '12F');

    address.city = 'St. Petersburg';

    test('set city field', () {
      expect(address.city, 'St. Petersburg');
    });

    address.street = 'Nevsky Prospect';

    test('set street field', () {
      expect(address.street, 'Nevsky Prospect');
    });

    address.building = '25G';

    test('set building field', () {
      expect(address.building, '25G');
    });
  });

  group('other tests', () {
    Address address = new Address('Moscow', 'Fuchika str.', '12F');
    test('toString()', () {
      expect(address.toString(), 'Moscow, Fuchika str. 12F');
    });
  });
}