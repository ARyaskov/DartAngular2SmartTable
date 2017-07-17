import 'package:angular2/angular2.dart';
import 'common.dart';

@Component(
  selector: 'smart-table-component',
  templateUrl: 'smart_table_component.html',
  providers: const [SmartTableRecordDataService]
)
class SmartTableComponent {
  final SmartTableRecordDataService m_dataService;

  SmartTableComponent(this.m_dataService);

  String getSexAsString(Sex sex) {
    String result  = 'Male';
    if (sex.index == Sex.female.index){
      result = 'Female';
    }
    return result;
  }
}