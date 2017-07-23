import 'dart:mirrors';
import 'package:angular2/core.dart';
import 'smart_table_record.dart';

@Pipe('orderBy')
class OrderByPipe implements PipeTransform {
  int _convertSortOrderToInt(String order){
    int result = 0;
    if (order.compareTo('asc') == 0){
      result = -1;
    }else if (order.compareTo('des') == 0){
      result = 1;
    }
    return result;
  }

  List<SmartTableRecord> transform(List<SmartTableRecord> array, String columnName, String order) {
    if (columnName.isNotEmpty && order.isNotEmpty) {
      bool isColumnExists = false;
      Symbol simpleNameAsSymbol;
      ClassMirror classMirror = reflectClass(SmartTableRecord);
      for (DeclarationMirror m in classMirror.declarations.values) {
        simpleNameAsSymbol = m.simpleName;
        String simpleName = MirrorSystem.getName(m.simpleName);
        if (columnName.compareTo(simpleName) == 0) {
          isColumnExists = true;
          break;
        }
      }
      if (isColumnExists) {
        array.sort((SmartTableRecord a, SmartTableRecord b) {
          var value1 = reflect(a)
              .getField(simpleNameAsSymbol)
              .reflectee;
          var value2 = reflect(b)
              .getField(simpleNameAsSymbol)
              .reflectee;
          if (value1 is Comparable != true) {
            value1 = value1.toString();
            value2 = value2.toString();
          }
          if (value1.compareTo(value2) < 0) {
            return 1 * _convertSortOrderToInt(order);
          } else if (value1.compareTo(value2) > 0) {
            return -1 * _convertSortOrderToInt(order);
          } else {
            return 0;
          }
        });
      }
    }
    return array;
  }
}