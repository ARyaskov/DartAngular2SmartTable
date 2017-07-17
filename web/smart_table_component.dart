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
}