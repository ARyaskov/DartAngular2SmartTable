import 'package:angular2/angular2.dart';
import 'common.dart';

@Component(
  selector: 'smart-table-component',
  template: '''
      <table>
      <th>Имя</th><th>Возраст</th><th>Департамент</th><th>Адрес</th>
      <tr *ngFor="#record of m_dataService.data">
      <td>{{record.name}}</td>
      <td>{{record.age}}</td>
      <td>{{record.sex}}</td>
      <td>{{record.department.name}}</td>
      <td>{{record.address.city}}, {{record.address.street}} {{record.address.building}}</td>
      </tr>
      <tr>
      </table>
    ''',
  providers: const [SmartTableRecordDataService]
)
class SmartTableComponent {
  final SmartTableRecordDataService m_dataService;

  SmartTableComponent(this.m_dataService);
}