import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Order List"),
          bottom: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "UNPAID"),
              Tab(text: "PAID"),
              Tab(text: "CLOSED"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrderListTab(),
            Center(child: Text("Paid Orders")),
            Center(child: Text("Closed Orders")),
          ],
        ),
      ),
    );
  }
}

class OrderListTab extends StatelessWidget {
  const OrderListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        OrderCard(
          orderNumber: "#5 (quick order)",
          client: "Any Client",
          leftToPay: "0.01 \$ of total 0.01 \$",
          time: "10:28 1 May 2024",
          name: "Sylvia Do",
          items: const ["1.0 * test"],
        ),
        OrderCard(
          orderNumber: "#14 (kiosk)",
          client: "Any Client",
          leftToPay: "53.7 \$ of total 53.7 \$",
          time: "02:55 4 May 2024",
          name: "Sylvia Do",
          items: const [
            "1.0 * OREO CHEESECAKE",
            "1.0 * PEACH LEMONADE",
            "1.0 * CHICKEN (GRILLED) BENTO BOX",
            "1.0 * CREAMY VEGETARIAN",
            "1.0 * GRILLE SHRIMP",
            "1.0 * THIN RAMEN",
            "1.0 * BEET RAMEN",
            "1.0 * SCALLION",
            "1.0 * EXTRA PORK BELLY",
            "1.0 * EXTRA BOILED EGG",
          ],
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderNumber, client, leftToPay, time, name;
  final List<String> items;

  OrderCard({
    required this.orderNumber,
    required this.client,
    required this.leftToPay,
    required this.time,
    required this.name,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderNumber, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(client, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text("Left to pay $leftToPay", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text("$time  $name", style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) => Text(item)).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("Info", Colors.blue, context),
                _buildButton("Pay", Colors.blue, context),
                _buildButton("Print", Colors.green, context),
                _buildButton("Void", Colors.grey, context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}