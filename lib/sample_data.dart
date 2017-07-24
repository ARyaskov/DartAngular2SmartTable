part of smart_table_component;

List<SmartTableRecord> sampleRecords = new List(15);

void fillSampleData() {
  sampleRecords[0] = new SmartTableRecord(
      'Shaun', 30, Sex.male(), new Department('Australia dept.'),
      new Address("Canberra", "Downing str.", '10b'));

  sampleRecords[1] = new SmartTableRecord(
      'Viki', 23, Sex.female(), new Department('Slovakia dept.'),
      new Address("Bratislava", "Ivanka str.", '22'));

  sampleRecords[2] = new SmartTableRecord(
      'Samuel',51, Sex.male(), new Department('USA dept.'),
      new Address("Washington D.C.", "575th ave.", '101F'));

  sampleRecords[3] = new SmartTableRecord(
      'Andrew',29, Sex.male(), new Department('Russia dept.'),
      new Address("Moscow", "Lenina str.", '12'));

  sampleRecords[4] = new SmartTableRecord(
      'Melissa',26, Sex.female(), new Department('Italy dept.'),
      new Address("Rome", "Juliano str.", '65'));

  sampleRecords[5] = new SmartTableRecord(
      'Santyago',30, Sex.male(), new Department('Spain dept.'),
      new Address("Madrid", "Andalusia str.", '1'));

  sampleRecords[6] = new SmartTableRecord(
      'Bian',49, Sex.female(), new Department('Vietnam dept.'),
      new Address("Hanoi", "Hao Nam str.", '40G'));

  sampleRecords[7] = new SmartTableRecord(
      'Vinni',43, Sex.male(), new Department('Finland dept.'),
      new Address("Helsinki", "Simonkatu str.", '2'));

  sampleRecords[8] = new SmartTableRecord(
      'John',52, Sex.male(), new Department('UK dept.'),
      new Address("London", "King str.", '5C'));

  sampleRecords[9] = new SmartTableRecord(
      'Ruslan',51, Sex.male(), new Department('Russia dept.'),
      new Address("Moscow", "Brodskogo str.", '7'));

  sampleRecords[10] = new SmartTableRecord(
      'Sergei',36, Sex.male(), new Department('Russia dept.'),
      new Address("Moscow", "Fuchika str.", '8'));

  sampleRecords[11] = new SmartTableRecord(
      'Natalia',51, Sex.female(), new Department('Russia dept.'),
      new Address("Moscow", "Gashika str.", '14'));

  sampleRecords[12] = new SmartTableRecord(
      'Silvio',27, Sex.male(), new Department('Italy dept.'),
      new Address("Milano", "Corso Magento str.", '32'));

  sampleRecords[13] = new SmartTableRecord(
      'Beatrice',46, Sex.female(), new Department('Italy dept.'),
      new Address("Milano", "Corso Magento str.", '32'));

  sampleRecords[14] = new SmartTableRecord(
      'Willy',51, Sex.male(), new Department('Finland dept.'),
      new Address("Helsinki", "Simonkatu str.", '5'));
}