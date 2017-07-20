import 'package:angular2/angular2.dart';
import 'order_by_pipe.dart';
import 'filter_by_pipe.dart';
import 'smart_table_record_data_service.dart';

@Component(
  selector: 'smart-table-component',
  templateUrl: 'smart_table_component.html',
  providers: const [SmartTableRecordDataService],
  pipes: const [OrderByPipe, FilterByPipe]
)
class SmartTableComponent {
  final SmartTableRecordDataService m_dataService;
  SmartTableComponent(this.m_dataService);
}