@TestOn("dart-vm")

import 'package:test/test.dart';
import 'package:DartAngular2SmartTable/smart_table_component.dart';

void main() {
  test('transform() asc sort', () {
    OrderByPipe orderByPipe = new OrderByPipe();
    SmartTableRecord alexRecord = new SmartTableRecord('Alex',
        35,
        Sex.male(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '12F'));
    SmartTableRecord mariaRecord = new SmartTableRecord('Maria',
        25,
        Sex.female(),
        new Department('Italy dept.'),
        new Address('Milano', 'Corso Magento str.', '32'));
    SmartTableRecord innaRecord = new SmartTableRecord('Inna',
        51,
        Sex.female(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '98q'));
    List<SmartTableRecord> smartTableRecordList = [alexRecord, mariaRecord, innaRecord];

    List<SmartTableRecord> smartTableRecordListNameByAsc = [alexRecord, innaRecord, mariaRecord];

    List<SmartTableRecord> smartTableRecordListResult =
      orderByPipe.transform(smartTableRecordList, 'name', 'asc');

    expect(smartTableRecordListResult, smartTableRecordListNameByAsc);
  });

  test('transform() des sort', () {
    OrderByPipe orderByPipe = new OrderByPipe();
    SmartTableRecord alexRecord = new SmartTableRecord('Alex',
        35,
        Sex.male(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '12F'));
    SmartTableRecord mariaRecord = new SmartTableRecord('Maria',
        25,
        Sex.female(),
        new Department('Italy dept.'),
        new Address('Milano', 'Corso Magento str.', '32'));
    SmartTableRecord innaRecord = new SmartTableRecord('Inna',
        51,
        Sex.female(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '98q'));
    List<SmartTableRecord> smartTableRecordList = [alexRecord, mariaRecord, innaRecord];

    List<SmartTableRecord> smartTableRecordListNameByDes = [mariaRecord, innaRecord, alexRecord];

    List<SmartTableRecord> smartTableRecordListResult =
      orderByPipe.transform(smartTableRecordList, 'name', 'des');

    expect(smartTableRecordListResult, smartTableRecordListNameByDes);
  });

  test('transform() wrong order', () {
    OrderByPipe orderByPipe = new OrderByPipe();
    SmartTableRecord alexRecord = new SmartTableRecord('Alex',
        35,
        Sex.male(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '12F'));
    SmartTableRecord mariaRecord = new SmartTableRecord('Maria',
        25,
        Sex.female(),
        new Department('Italy dept.'),
        new Address('Milano', 'Corso Magento str.', '32'));
    SmartTableRecord innaRecord = new SmartTableRecord('Inna',
        51,
        Sex.female(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '98q'));
    List<SmartTableRecord> smartTableRecordList = [alexRecord, mariaRecord, innaRecord];

    List<SmartTableRecord> smartTableRecordListNameWrongOrder = [alexRecord, mariaRecord, innaRecord];

    List<SmartTableRecord> smartTableRecordListResult =
      orderByPipe.transform(smartTableRecordList, 'name', 'wrongOrder');

    expect(smartTableRecordListResult, smartTableRecordListNameWrongOrder);
  });

  test('transform() wrong field', () {
    OrderByPipe orderByPipe = new OrderByPipe();
    SmartTableRecord alexRecord = new SmartTableRecord('Alex',
        35,
        Sex.male(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '12F'));
    SmartTableRecord mariaRecord = new SmartTableRecord('Maria',
        25,
        Sex.female(),
        new Department('Italy dept.'),
        new Address('Milano', 'Corso Magento str.', '32'));
    SmartTableRecord innaRecord = new SmartTableRecord('Inna',
        51,
        Sex.female(),
        new Department('Russia dept.'),
        new Address('Moscow', 'Fuchika str.', '98q'));
    List<SmartTableRecord> smartTableRecordList = [alexRecord, mariaRecord, innaRecord];

    try {
      orderByPipe.transform(smartTableRecordList, 'wrongField', 'asc');
      expect(true, false);
    } on NoSuchMethodError {
      expect(true, true);
    }
  });
}