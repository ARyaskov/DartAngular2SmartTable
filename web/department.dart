class Department {
  String m_name;

  String get name => m_name;
  void set name(String name) {
    m_name = name;
  }

  Department(this.m_name);

  String toString(){
    return m_name;
  }
}