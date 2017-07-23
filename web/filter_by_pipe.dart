import 'dart:mirrors';
import 'common.dart';
import 'package:angular2/core.dart';
import 'smart_table_record.dart';

@Pipe('filterBy')
class FilterByPipe implements PipeTransform {
  List<SmartTableRecord> transform(List<SmartTableRecord> array, List<String> keys, List<String> values) {
    Map<String, String> filterData = new Map.fromIterables(keys, values);
    filterData.forEach((key, value) {
      array = array.where((item) {
        return value.compareTo(getProperty(item, key).reflectee.toString()) == 0;
      }).toList();
    });
    return array;
  }
}