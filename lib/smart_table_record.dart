part of smart_table_component;

class SmartTableRecord {
  String _name;
  int _age;
  Sex _sex;
  Department _department;
  Address _address;

  String get name => _name;
  void set name(String name) {
    _name = name;
  }

  int get age => _age;
  void set age(int age) {
    _age = age;
  }

  Sex get sex => _sex;
  void set sex(Sex sex) {
    _sex = sex;
  }

  Department get department => _department;
  void set department(Department department) {
    _department = department;
  }

  Address get address => _address;
  void set address(Address address) {
    _address = address;
  }

  SmartTableRecord(
      this._name, this._age, this._sex, this._department, this._address);
}
