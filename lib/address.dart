part of smart_table_component;

class Address {
  String _city;
  String _street;
  String _building;

  String get city => _city;
  void set city(String city) {
    _city = city;
  }

  String get street => _street;
  void set street(String street) {
    _street = street;
  }

  String get building => _building;
  void set building(String building) {
    _building = building;
  }

  Address(this._city, this._street, this._building);

  String toString() {
    return _city + ', ' + _street + ' ' + _building;
  }
}
