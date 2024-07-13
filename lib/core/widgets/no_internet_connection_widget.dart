import 'package:flutter/material.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Icon(Icons.wifi_off_outlined),
            Text('No Internet Connection!'),
          ],
        ),
      ),
    );
  }
}
