part of smart_table_component;

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
        array.sort((SmartTableRecord a, SmartTableRecord b) {
          var value1 = getProperty(a, columnName).reflectee;
          var value2 = getProperty(b, columnName).reflectee;
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
    return array;
  }
}