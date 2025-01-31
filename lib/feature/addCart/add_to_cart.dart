import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_task/core/database_helper.dart';
import 'package:pos_task/feature/addCart/cart/food_bloc.dart';
import 'package:pos_task/models/food.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
   List<Food> foods = [
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FoodBloc>().add(LoadFoods());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing'),
        actions: [
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.receipt),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<FoodBloc, FoodState>(
                builder: (context, state) {
                  if (state is FoodLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is FoodLoaded) {
                    return ListView.builder(
                      itemCount: state.foods.length,
                      itemBuilder: (context, index) {
                        final item = state.foods[index];
                        return ListTile(
                          title: Text("1.0* ${item.name}"),
                          trailing: Text("\$${item.price}"),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("No foods available"));
                  }
                },
              ),

            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text('Sales TAX +7.5%')),
                Chip(label: Text('SVC +4.0%')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.local_fire_department),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: () {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('%'),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
      SizedBox(
                  height: 400,
                  child: BentoBoxBottomSheet(),
                )
          ],
        ),
      ),
    );
  }

}

class BentoBoxBottomSheet extends StatelessWidget {

  final List<Food> bentoBoxes = [
    Food(name: "CHICKEN (GRILLED) BENTO BOX", price: 17.0),
    Food(name: "CHICKEN TEMPURA BENTO BOX", price: 17.0),
    Food(name: "FRIED TOFU BENTO BOX", price: 15.0),
    Food(name: "GRILLED TOFU BENTO BOX", price: 15.0),
    Food(name: "SALMON BENTO BOX", price: 16.0),
    Food(name: "SHRIMP (GRILLED) BENTO BOX", price: 17.0),
    Food(name: "SHRIMP (TEMPURA) BENTO BOX", price: 17.0),
    Food(name: "STEAK BENTO BOX", price: 18.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                "BENTO BOX",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.qr_code, size: 24),
              SizedBox(width: 10),
              Icon(Icons.search, size: 24),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: bentoBoxes.length,
              itemBuilder: (context, index) {
                final item = bentoBoxes[index];
                return InkWell(
                  onTap: () => context.read<FoodBloc>().add(AddFood(item)),
                  child: BentoBoxCard(
                  name: item.name,
                  price: item.price.toString(),
                  image: "",
                ),);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BentoBoxCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const BentoBoxCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Text(
                  "\$${price}",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
