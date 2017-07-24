part of smart_table_component;


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