library smart_table_component;

import 'dart:mirrors';
import 'dart:collection';
import 'package:angular2/angular2.dart';

part 'address.dart';
part 'common.dart';
part 'department.dart';
part 'filter.dart';
part 'filter_by_pipe.dart';
part 'order_by_pipe.dart';
part 'sample_data.dart';
part 'sex.dart';
part 'smart_table_record.dart';
part 'smart_table_record_data_service.dart';

@Component(
    selector: 'smart-table-component',
    templateUrl: 'smart_table_component.html',
    providers: const [SmartTableRecordDataService],
    pipes: const [OrderByPipe, FilterByPipe])
class SmartTableComponent {
  SmartTableRecordDataService _dataService;
  List<String> _filterKeys;
  List<String> _filterValues;
  Map<String, Filter> _filters;
  static FilterByPipe _filterByPipe = new FilterByPipe();
  String _sortColumnName;
  String _sortColumnOrder;

  SmartTableRecordDataService get dataService => _dataService;
  String get sortColumnName => _sortColumnName;
  String get sortColumnOrder => _sortColumnOrder;
  void set sortColumnName(String newSortColumnName) {
    _sortColumnName = newSortColumnName;
  }

  void set sortColumnOrder(String newSortColumnOrder) {
    _sortColumnOrder = newSortColumnOrder;
  }

  List<SmartTableRecord> getFilteredRecords() {
    return _filterByPipe.transform(
        _dataService.data, _filterKeys, _filterValues);
  }

  Map<String, Filter> get filters => _filters;

  SmartTableComponent(SmartTableRecordDataService smartTableRecordDataService) {
    _dataService = smartTableRecordDataService;
    _filterKeys = new List<String>();
    _filterValues = new List<String>();
    _filters = new Map<String, Filter>();
    _filters.putIfAbsent(
        'sex', () => new Filter(this, 'sexFilter', 'Пол', 'sex', false));
    _filters.putIfAbsent(
        'department',
        () => new Filter(
            this, 'departmentFilter', 'Департамент', 'department.name', false));
    _filters.putIfAbsent(
        'addressCity',
        () => new Filter(
            this, 'addressCityFilter', 'Город', 'address.city', false));
    _sortColumnName = '';
    _sortColumnOrder = '';
  }

  void addFilterKeyValue(String name, String value) {
    _filterKeys.add(name);
    _filterValues.add(value);
  }

  void removeFilterKey(String name) {
    _filterValues.removeAt(_filterKeys.indexOf(name));
    _filterKeys.remove(name);
  }

  void onSortNameOrderChanged(String column, String order) {
    if (column.isNotEmpty) {
      _sortColumnName = column;
      _sortColumnOrder = order;
    } else {
      _sortColumnName = '';
      _sortColumnOrder = '';
    }
  }
}
