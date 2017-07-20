import 'dart:mirrors';
import 'package:angular2/core.dart';
import 'smart_table_record.dart';

@Pipe('filterBy')
class FilterByPipe implements PipeTransform {
  InstanceMirror getProperty<T>(T object, String property){
    InstanceMirror result;
    InstanceMirror instanceMirror = reflect(object);
    bool doneFlag = false;
    while (!doneFlag) {
      if (property.contains('.')) {
        String fieldName = property.substring(0, property.indexOf('.'));
        property = property.substring(property.indexOf('.') + 1, property.length);
        instanceMirror = instanceMirror.getField(MirrorSystem.getSymbol(fieldName));
      }else{
        result = instanceMirror.getField(MirrorSystem.getSymbol(property));
        doneFlag = true;
      }
    }
    return result;
  }

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