import 'package:flutter/material.dart';

ShowNumber(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context,  index) {
        return GestureDetector(
          onTap: () {
            // Handle number click here
            print('Clicked on number ${index + 1}');
          },
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
