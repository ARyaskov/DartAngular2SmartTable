part of smart_table_component;

class Filter {
  SmartTableComponent _object;
  String _name;
  String _title;
  String _classFieldName;
  bool _isMultipleSelection;
  List<String> _currentValues;

  bool get isSomeValuesChecked => _currentValues.length > 0;
  List<String> get currentValues => _currentValues;
  SmartTableComponent get object => _object;
  String get name => _name;
  String get title => _title;
  String get classFieldName => _classFieldName;
  bool get isMultipleSelection => _isMultipleSelection;

  Filter(SmartTableComponent object, String name, String title,
      String classFieldName, bool isMultipleSelection) {
    _object = object;
    _name = name;
    _title = title;
    _classFieldName = classFieldName;
    _isMultipleSelection = isMultipleSelection;
    _currentValues = new List<String>();
  }

  Map<String, int> getValuesAndCounts() {
    SplayTreeMap<String, int> result = new SplayTreeMap<String, int>();
    List<SmartTableRecord> listOfRecords = _object.dataService.data;
    List<SmartTableRecord> filteredListOfRecords = _object.getFilteredRecords();
    listOfRecords.forEach((SmartTableRecord record) {
      InstanceMirror instanceMirror = getProperty(record, _classFieldName);
      String valueOfProperty = instanceMirror.reflectee.toString();
      if (filteredListOfRecords.contains(record)) {
        if (result.containsKey(valueOfProperty)) {
          result[valueOfProperty]++;
        } else {
          result.putIfAbsent(valueOfProperty, () => 1);
        }
      } else {
        result.putIfAbsent(valueOfProperty, () => 0);
      }
    });

    return result;
  }

  void onFilterValueClicked(String value) {
    if (_isMultipleSelection != true) {
      if (_currentValues.length > 0) {
        _currentValues.removeLast();
        _object.removeFilterKey(_classFieldName);
      } else {
        _currentValues.add(value);
        _object.addFilterKeyValue(_classFieldName, value);
      }
    } else {
      if (_currentValues.contains(value)) {
        _currentValues.remove(value);
        _object.removeFilterKey(_classFieldName);
      } else {
        _currentValues.add(value);
        _object.addFilterKeyValue(_classFieldName, value);
      }
    }
  }

  bool isDisabled(String value) {
    bool result = false;
    if (_isMultipleSelection != true) {
      if (_currentValues.length > 0 && _currentValues.contains(value) != true ||
          getValuesAndCounts()[value] == 0) {
        result = true;
      }
    } else {
      // TODO
    }

    return result;
  }

  void clear() {
    _currentValues.clear();
    _object.removeFilterKey(_classFieldName);
  }

  bool isChecked(String value) {
    bool result = false;
    if (_isMultipleSelection != true) {
      if (_currentValues.contains(value)) {
        result = true;
      }
    } else {
      // TODO
    }

    return result;
  }

  bool canBeCleared() {
    return _currentValues.length > 0;
  }
}
