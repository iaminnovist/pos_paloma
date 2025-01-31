import 'package:flutter/material.dart';
import 'package:pos_task/feature/tab_feature.dart/exit_page.dart';

import 'orderListScreen.dart';
import 'tab_feature.dart/quick_order_page.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  TabController? _tabController; // Controller for top TabBar
  int _selectedIndex = 0; // Track selected index of BottomNavigationBar

  // Initialize the TabController for the top TabBar
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  // Handle bottom tab navigation
  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Handle top tab navigation
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Key to control drawer
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), // Drawer menu icon
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Open drawer manually
          },
        ),
        title: Text("Table Service"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Default Room'), // Only one tab here
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: IndexedStack(
        index:
            _selectedIndex, // Show the correct page based on bottom nav selection
        children: <Widget>[
          // Pages corresponding to bottom tabs
          Center(child: ExitPage()),
          Center(child: Text('Order Page')),
          Center(child: Text('List Page')),
          Center(child: QuickOrderPage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Selected icon and text color
        unselectedItemColor: Colors.black,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Exit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
            ),
            label: 'Quick Order',
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Section
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text("Sylvia Do", style: TextStyle(color: Colors.black)),
            accountEmail: Text("Waiter 1", style: TextStyle(color: Colors.grey)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text("S", style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
          ),

          // Drawer Items
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(Icons.restaurant, "Table Service", context),
                _buildDrawerItem(Icons.fastfood, "Quick Order", context),
                _buildDrawerItem(Icons.delivery_dining, "Delivery", context),
                _buildDrawerItem(Icons.kitchen, "Kitchen Display", context),
                _buildDrawerItem(Icons.access_time, "Clock Time", context),
                _buildDrawerItem(Icons.list_alt, "Order List", context),
                _buildDrawerItem(Icons.bar_chart, "Reports", context),
                _buildDrawerItem(Icons.checklist, "Order Ready Screen", context),
                _buildDrawerItem(Icons.price_change, "Price Checker", context),
                _buildDrawerItem(Icons.settings, "Settings", context),
                _buildDrawerItem(Icons.exit_to_app, "Exit", context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom method to create menu items
  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: () {
        if(title == "Order List"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderListScreen()),
          );
        }else {
          Navigator.pop(context); // Close drawer on tap
        }
      },
    );
  }
}