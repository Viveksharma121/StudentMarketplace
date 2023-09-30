import 'package:classico/src/features/authentication/screens/Forms/SellerForm.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align elements to the right
          children: [
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Vertically center elements
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align elements to the left
              children: [
                Text(
                  'Carssss',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  children: [
                    SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Action when the "Buy Book" button is pressed.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerForm(),
                          ),
                        );
                      },
                      child: Text("Buy Book"),
                    ),
                    SizedBox(width: 70), // Add spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Action when the "Sell Book" button is pressed.
                      },
                      child: Text("Sell Book"),
                    ),
                  ],
                ),
              ],
            ),
            // Image placed to the right
            // Image.asset(
            //   'assets/your_image.png', // Replace with the path to your image
            //   width: 100, // Adjust the width as needed
            //   height: 100, // Adjust the height as needed
            // ),
          ],
        ),
      ),
    );
  }
}
