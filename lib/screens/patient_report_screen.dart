import 'package:flutter/material.dart';

class PatientReportScreen extends StatefulWidget {
  static const routeName = '/patient-report-screen';

  @override
  _PatientReportScreenState createState() => _PatientReportScreenState();
}

class _PatientReportScreenState extends State<PatientReportScreen> {
  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Key Words"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.firstName.compareTo(b.firstName));
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Sample Data"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.lastName.compareTo(b.lastName));
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: names
          .map(
            (name) => DataRow(
                  cells: [
                    DataCell(
                      Text(name.firstName),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name.lastName),
                      showEditIcon: false,
                      placeholder: false,
                    )
                  ],
                ),
          )
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("patient - prescription"),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }
}

class Name {
  String firstName;
  String lastName;

  Name({this.firstName, this.lastName});
}

var names = <Name>[
  Name(firstName: "Name", lastName: "Sharat Sharma, 30 Male"),
  Name(firstName: "Symptoms", lastName: lastName()),
  Name(firstName: "Diagnosis", lastName: "Acute Bronchitis"),
  Name(firstName: "Prescription", lastName: '''Azithromycin 500 mg once a day for 3 days, Robitussin 5 ml thrice a day for 5 days'''),
  Name(firstName: "Advice", lastName: '''
Drink Warm water, Don't eat grapes'''),
];

String lastName() {
  return """
Dry cough for last 3 days, No fever, Running Nose """;
}

