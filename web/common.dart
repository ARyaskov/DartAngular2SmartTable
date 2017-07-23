import 'dart:mirrors';

InstanceMirror getProperty<T>(T object, String property){
  InstanceMirror result;
  InstanceMirror instanceMirror = reflect(object);
  bool doneFlag = false;
  while (!doneFlag) {
    if (property.contains('.')) {
      String fieldName = property.substring(0, property.indexOf('.'));
      property = property.substring(property.indexOf('.') + 1, property.length);
      instanceMirror = instanceMirror.getField(MirrorSystem.getSymbol(fieldName));
    }else{
      result = instanceMirror.getField(MirrorSystem.getSymbol(property));
      doneFlag = true;
    }
  }
  return result;
}