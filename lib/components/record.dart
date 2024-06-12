class Record {
  final String name;
  final String bmi;
  final String result;

  Record({required this.name, required this.bmi, required this.result});
}

/*
      body: Column(
        children: [
          ListView.builder(
            itemCount: records == null ? 0 : records?.length,
            itemBuilder: (context, index) {
              final record = records?[index];
              return ListTile(
                title: Text(record!.name),
                subtitle: Text('BMI: ${record.bmi}, Result: ${record.result}'),
              );
            },
          ),
        ],
      ),
    */