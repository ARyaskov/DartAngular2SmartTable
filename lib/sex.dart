part of smart_table_component;

class Sex {
  String _value = getMaleLabel();
  static String _maleLabel = "Male";
  static String _femaleLabel = "Female";
  static Sex _maleInstance;
  static Sex _femaleInstance;

  String getValue() => _value;
  void _setValue(String newValue) {
    _value = newValue;
  }

  Sex makeMale() {
    this._setValue(getMaleLabel());
    return this;
  }

  Sex makeFemale() {
    this._setValue(getFemaleLabel());
    return this;
  }

  static String getMaleLabel() => _maleLabel;
  static String getFemaleLabel() => _femaleLabel;

  static Sex male() {
    if (_maleInstance == null) {
      _maleInstance = new Sex().makeMale();
    }
    return _maleInstance;
  }

  static Sex female() {
    if (_femaleInstance == null) {
      _femaleInstance = new Sex().makeFemale();
    }
    return _femaleInstance;
  }

  String toString() {
    return _value;
  }
}
