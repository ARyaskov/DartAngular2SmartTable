import 'package:angular2/angular2.dart';
import 'smart_table_record.dart';
import 'sample_data.dart';

@Injectable()
class SmartTableRecordDataService {
  List<SmartTableRecord> get data => sampleRecords;
}
