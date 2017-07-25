@TestOn("dart-vm")

import 'package:test/test.dart';
import 'package:DartAngular2SmartTable/smart_table_component.dart';

void main() {
    test('transform()', () {
      FilterByPipe filterByPipe = new FilterByPipe();
      List<SmartTableRecord> smartTableRecordList = [
        new SmartTableRecord('Igor',
            35,
            Sex.male(),
            new Department('Russia dept.'),
            new Address('Moscow', 'Fuchika str.', '12F')),
        new SmartTableRecord('Maria',
            25,
            Sex.female(),
            new Department('Italy dept.'),
            new Address('Milano', 'Corso Magento str.', '32')),
        new SmartTableRecord('Inna',
            51,
            Sex.female(),
            new Department('Russia dept.'),
            new Address('Moscow', 'Fuchika str.', '98q'))
      ];
      List<String> keys = ['address.city'];
      List<String> values = ['Moscow'];
      List<SmartTableRecord> smartTableRecordListResult =
        filterByPipe.transform(smartTableRecordList, keys, values);

      expect(smartTableRecordListResult, smartTableRecordList..removeAt(1));
    });

    test('transform() filter all values', () {
      FilterByPipe filterByPipe = new FilterByPipe();
      List<SmartTableRecord> smartTableRecordList = [
        new SmartTableRecord('Igor',
            35,
            Sex.male(),
            new Department('Russia dept.'),
            new Address('Moscow', 'Fuchika str.', '12F')),
        new SmartTableRecord('Maria',
            25,
            Sex.female(),
            new Department('Italy dept.'),
            new Address('Milano', 'Corso Magento str.', '32')),
        new SmartTableRecord('Inna',
            51,
            Sex.female(),
            new Department('Russia dept.'),
            new Address('Moscow', 'Fuchika str.', '98q'))
      ];
      List<String> keys = ['address.city'];
      List<String> values = ['St. Petersburg'];
      List<SmartTableRecord> smartTableRecordListResult =
        filterByPipe.transform(smartTableRecordList, keys, values);

      expect(smartTableRecordListResult, []);
    });

    test('transform() filter none', () {
      FilterByPipe filterByPipe = new FilterByPipe();
      List<SmartTableRecord> smartTableRecordList = [
        new SmartTableRecord('Igor',
            35,
            Sex.male(),
            new Department('Russia dept.'),
            new Address('Moscow', 'Fuchika str.', '12F')),
        new SmartTableRecord('Maria',
            25,
            Sex.female(),
            new Department('Italy dept.'),
            new Address('Milano', 'Corso Magento str.', '32')),
        new SmartTableRecord('Inna',
            51,
            Sex.female(),
            new Department('Russia dept.'),
            new Address('Moscow', 'Fuchika str.', '98q'))
      ];
      List<String> keys = ['address.city'];
      List<String> values = [''];
      List<SmartTableRecord> smartTableRecordListResult =
        filterByPipe.transform(smartTableRecordList, keys, values);

      expect(smartTableRecordListResult, smartTableRecordList);
    });
}