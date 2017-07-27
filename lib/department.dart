part of smart_table_component;

class Department {
  String _name;

  String get name => _name;
  void set name(String name) {
    _name = name;
  }

  Department(this._name);

  String toString() {
    return _name;
  }
}
