import 'common.dart';
import 'department.dart';
import 'address.dart';
import 'smart_table_record.dart';

List<SmartTableRecord> sampleRecords = new List(3);

void fillSampleData() {
  sampleRecords[0] = new SmartTableRecord('Shaun', 30, Sex.male,
      new Department('Australia dept.'),
      new Address("Сanberra", "Downing str.", '10b'));

  sampleRecords[1] = new SmartTableRecord(
      'Viki', 23, Sex.female, new Department('Slovakia dept.'),
      new Address("Bratislava", "Ivanka str.", '22'));

  sampleRecords[2] = new SmartTableRecord(
      'Samuel',51, Sex.male, new Department('USA dept.'),
      new Address("Washington D.C.", "575th ave.", '101F'));
}