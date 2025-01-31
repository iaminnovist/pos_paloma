import 'package:flutter/material.dart';

import '../addCart/add_to_cart.dart';

class QuickOrderPage extends StatefulWidget {
  const QuickOrderPage({super.key});

  @override
  State<QuickOrderPage> createState() => _QuickOrderPageState();
}

class _QuickOrderPageState extends State<QuickOrderPage> {
  final List<Map<String, dynamic>> tableData = [
    {
      "table": "T 1",
      "name": "Sylvia Do",
      "count": "1/4",
      "time": "09:30",
      "color": Colors.redAccent
    },
    {
      "table": "T 10",
      "name": "Sylvia Do",
      "count": "1/4",
      "time": "13:51",
      "color": Colors.redAccent
    },
    {
      "table": "T 11",
      "name": "Jessica Lam HEO U",
      "count": "2/4",
      "time": "05:06",
      "color": Colors.grey
    },
    {"table": "T 12", "count": "0/4", "color": Colors.green},
    {
      "table": "T 13",
      "name": "Sylvia Do",
      "count": "1/4",
      "time": "19:10",
      "color": Colors.redAccent
    },
    {"table": "T 14", "count": "0/4", "color": Colors.green},
    {"table": "T 15", "count": "0/4", "color": Colors.green},
    {"table": "T 16", "count": "0/4", "color": Colors.green},
    {
      "table": "T 2",
      "name": "Jessica Lam HEO U",
      "count": "1/4",
      "time": "12:02",
      "color": Colors.grey
    },
    {"table": "T 3", "count": "0/4", "color": Colors.green},
    {"table": "T 4", "count": "0/4", "color": Colors.green},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: tableData.length,
          itemBuilder: (context, index) {
            final table = tableData[index];
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddToCartPage(),
                  )),
              child: TableTile(
                tableNumber: table['table'],
                name: table['name'],
                count: table['count'],
                time: table['time'],
                color: table['color'],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TableTile extends StatelessWidget {
  final String tableNumber;
  final String? name;
  final String count;
  final String? time;
  final Color color;

  const TableTile({
    Key? key,
    required this.tableNumber,
    this.name,
    required this.count,
    this.time,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border.all(
          color: Colors.black,
          width: 1, // Border width
        ),
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Column(
        children: [
          Spacer(),
          Text(
            tableNumber,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          if (name != null)
            Text(
              name!,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          Spacer(),
          Container(
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(count, style: const TextStyle(color: Colors.white)),
                if (time != null)
                  Text(time!, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
