import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String price;
  const SecondPage({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/217/217853.png",
                  width: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(price),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Rp. $price.000.00'),
          ],
        ),
      ),
    );
  }
}
