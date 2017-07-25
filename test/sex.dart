@TestOn("dart-vm")

import 'package:test/test.dart';
import 'package:DartAngular2SmartTable/smart_table_component.dart';

void main() {
    test('getValue()', () {
      expect(Sex.male().getValue(), 'Male');
    });

    test('toString()', () {
      Sex sex = Sex.male();
      expect(sex.toString(), 'Male');
    });

    test('male()', () {
      expect(Sex.male().toString(), 'Male');
    });

    test('female()', () {
      expect(Sex.female().toString(), 'Female');
    });

    test('makeMale()', () {
      Sex sex = Sex.female();
      expect(sex.makeMale().toString(), 'Male');
    });

    test('makeFemale()', () {
      Sex sex = Sex.male();
      expect(sex.makeFemale().toString(), 'Female');
    });

    test('getMaleLabel()', () {
      expect(Sex.getMaleLabel(), 'Male');
    });

    test('getFemaleLabel()', () {
      expect(Sex.getFemaleLabel(), 'Female');
    });
}