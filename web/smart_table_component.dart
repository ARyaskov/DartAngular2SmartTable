import 'package:angular2/angular2.dart';
import 'order_by_pipe.dart';
import 'filter_by_pipe.dart';
import 'smart_table_record.dart';
import 'smart_table_record_data_service.dart';
import 'filter.dart';

@Component(
  selector: 'smart-table-component',
  templateUrl: 'smart_table_component.html',
  providers: const [SmartTableRecordDataService],
  pipes: const [OrderByPipe, FilterByPipe]
)
class SmartTableComponent {
  SmartTableRecordDataService _dataService;
  List<String> _filterKeys;
  List<String> _filterValues;
  Map<String, Filter> _filters;
  static FilterByPipe _filterByPipe = new FilterByPipe();

  SmartTableRecordDataService get dataService => _dataService;

  List<SmartTableRecord> getFilteredRecords() {
    return _filterByPipe.transform(_dataService.data, _filterKeys, _filterValues);
  }

  Map<String, Filter> get filters => _filters;

  SmartTableComponent(SmartTableRecordDataService smartTableRecordDataService){
    _dataService = smartTableRecordDataService;
    _filterKeys = new List<String>();
    _filterValues = new List<String>();
    _filters = new Map<String, Filter>();
    _filters.putIfAbsent('sex', () => new Filter(this, 'sexFilter', 'Пол', 'sex', false));
    _filters.putIfAbsent('department', () => new Filter(this, 'departmentFilter', 'Департамент', 'department.name', false));
    _filters.putIfAbsent('addressCity', () => new Filter(this, 'addressCityFilter', 'Город', 'address.city', false));
  }

  void addFilterKeyValue(String name, String value){
    _filterKeys.add(name);
    _filterValues.add(value);
  }

  void removeFilterKey(String name){
    _filterValues.removeAt(_filterKeys.indexOf(name));
    _filterKeys.remove(name);
  }
}