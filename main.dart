import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HireBath(),
  ));
}

class HireBath extends StatefulWidget {
  const HireBath({super.key});

  @override
  State<HireBath> createState() => _HireBathState();
}

class _HireBathState extends State<HireBath> {
  final jobs = [
    {'title': 'Flutter Developer', 'company': 'Tech Company', 'match': 90},
    {'title': 'Data Analyst', 'company': 'Data Solutions', 'match': 80},
    {'title': 'UI/UX Designer', 'company': 'Creative Studio', 'match': 75},
  ];

  final Set<int> applied = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HIRE BATH'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];

          return Card(
            child: ListTile(
              title: Text(job['title'].toString()),
              subtitle: Text(
                '${job['company']}\nMatch: ${job['match']}%',
              ),
              isThreeLine: true,
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (applied.contains(index)) {
                      applied.remove(index);
                    } else {
                      applied.add(index);
                    }
                  });
                },
                child: Text(
                  applied.contains(index) ? 'Applied' : 'Apply',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
