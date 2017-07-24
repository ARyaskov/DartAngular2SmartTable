part of smart_table_component;

class SmartTableRecord {
  String m_name;
  int m_age;
  Sex m_sex;
  Department m_department;
  Address m_address;

  String get name => m_name;
  void set name(String name) {
    m_name = name;
  }

  int get age => m_age;
  void set age(int age) {
    m_age = age;
  }

  Sex get sex => m_sex;
  void set sex(Sex sex) {
    m_sex = sex;
  }

  Department get department => m_department;
  void set department(Department department) {
    m_department = department;
  }

  Address get address => m_address;
  void set address(Address address) {
    m_address = address;
  }

  SmartTableRecord(
      this.m_name, this.m_age, this.m_sex, this.m_department, this.m_address);
}
