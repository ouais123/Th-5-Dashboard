import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: SelectableText("Name"),
            size: ColumnSize.S,
          ),
          DataColumn2(
            label: SelectableText("Email"),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: SelectableText("Phone"),
            size: ColumnSize.M,
          ),
          DataColumn2(
            label: SelectableText("ID number"),
            size: ColumnSize.M,
          ),
        ],
        rows: const [
          DataRow2(
            cells: [
              DataCell(
                SelectableText("owais"),
              ),
              DataCell(
                SelectableText("owaes.hamouda.2000@gmail.com"),
              ),
              DataCell(
                SelectableText("0996464899"),
              ),
              DataCell(
                SelectableText("01010226589"),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(
                SelectableText("oamer"),
              ),
              DataCell(
                SelectableText("oamer@gmail.com"),
              ),
              DataCell(
                SelectableText("0988482380"),
              ),
              DataCell(
                SelectableText("01010256659"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
