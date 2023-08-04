import 'package:cofee_app/components/components.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isImagesVisible = false;
  bool isSign = true;
  final List<String> types = ['Latte', 'Cappuccino', 'Milk'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/latte.jpg', width: 100, height: 100),
                      SizedBox(height: 10,width: 10,),
                      Image.asset('assets/latte.jpg', width: 100, height: 100),
                      SizedBox(height: 10.0,width: 10,),
                      Image.asset('assets/latte.jpg', width: 100, height: 100),
                    ],
                  ),
                );
              },
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
                icon: Icon(Icons.person),
              onPressed: () {
                setState(() {
                  isImagesVisible = true;
                  isSign = false;

                });

              },
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Milk',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add your content here for the Milk tab
                        // For example, you can add a list of milk-based coffee drinks or any other content you desire.
                      ],
                    ),
                  ),
                );

              },
            );
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Find the best \ncoffee for you ',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //search bar
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Find Your Coffee ...',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                  ),
                ),
              ),

              //horizontal list of types of coffee
              Container(
                height: 40.0,
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CoffeeTypeItem(
                      name: types[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 30.0);
                  },
                  itemCount: types.length,
                ),
              ),

              //horizontal list of coffee tiles
              Visibility(
                visible: isSign,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CoffeeTiles(
                        name: 'Latte',
                        price: 4,
                        path: 'assets/latte2.jpg',
                      ),
                      CoffeeTiles(
                        name: 'Cappuccino',
                        price: 6,
                        path: 'assets/latte.jpg',
                      ),
                    ],
                  ),
                ),
              ),

              // Images placed below the SingleChildScrollView
        Visibility(
          visible: isImagesVisible,
          child: Row(
            children: [
              Image.asset('assets/latte.jpg', width: 100, height: 100),
            m
              SizedBox(width: 10),
              Image.asset('assets/latte.jpg', width: 100, height: 100),
              SizedBox(width: 10),
              Image.asset('assets/latte.jpg', width: 100, height: 100),
            ],
          ),
        ),
            ],
          ),
        ),
      ),
    );
  }
}
