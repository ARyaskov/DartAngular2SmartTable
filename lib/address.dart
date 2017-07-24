part of smart_table_component;

class Address {
  String m_city;
  String m_street;
  String m_building;

  String get city => m_city;
  void set city(String city) {
    m_city = city;
  }

  String get street => m_street;
  void set street(String street) {
    m_street = street;
  }

  String get building => m_building;
  void set building(String building) {
    m_building = building;
  }

  Address(this.m_city, this.m_street, this.m_building);

  String toString() {
    return m_city + ', ' + m_street + ' ' + m_building;
  }
}
