import 'package:flutter/material.dart';

class CoffeeTiles extends StatelessWidget {
  final String name;
  final int price;
  final String path;

  CoffeeTiles({required this.name, required this.price, required this.path});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.black54,
        ),
        width: 174.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
                height: 150.0,
                width: 150.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'With Almond Milk',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: [
                Text(
                  '\$',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  '${price.toString()}.25',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.orange,
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeTypeItem extends StatelessWidget {
  final String name;
  final int index;

  CoffeeTypeItem({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle onTap action if needed.
      },
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: index == 0 ? Colors.orange : Colors.grey,
        ),
      ),
    );
  }
}
