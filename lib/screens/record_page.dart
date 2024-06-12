import 'package:flutter/material.dart';
import '../components/record.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key, this.records});

  final List<Record>? records;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: records == null ? 0 : records?.length,
        itemBuilder: (context, index) {
          final record = records?[index];
          return ListTile(
            title: Text(record!.name),
            subtitle: Text('BMI: ${record.bmi}, Result: ${record.result}'),
          );
        },
      ),

      /*
      body: Center(
        child: Text(
          'Number of records: ${records?.length ?? 0}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      */
    );
  }
}
